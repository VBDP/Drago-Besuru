using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class SetScale : MonoBehaviour
{
    // Start is called before the first frame update

    private SetScale setScale;
    // Update is called once per frame
	void Update()
    {
        setScale = gameObject.GetComponent<SetScale>();
        Debug.Log("success");
        transform.localScale = new Vector3(5, 5, 5);
        //Destroy(gameObject.GetComponent<SetScale>());
	    Object.DestroyImmediate(this);
    }
}
