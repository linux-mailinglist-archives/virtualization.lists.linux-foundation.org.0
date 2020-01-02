Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D233812EA44
	for <lists.virtualization@lfdr.de>; Thu,  2 Jan 2020 20:20:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E2C387ADB;
	Thu,  2 Jan 2020 19:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68uJ0SxelU+M; Thu,  2 Jan 2020 19:20:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68D4387A9C;
	Thu,  2 Jan 2020 19:20:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 584E4C077D;
	Thu,  2 Jan 2020 19:20:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB383C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jan 2020 19:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C63F887A77
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jan 2020 19:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YzLujZKlig2V
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jan 2020 19:20:45 +0000 (UTC)
X-Greylist: delayed 00:08:34 by SQLgrey-1.7.6
Received: from smtp-pg11.blackberry.com (smtp-pg11.blackberry.com
 [68.171.242.227])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ABD2587A62
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jan 2020 19:20:45 +0000 (UTC)
Received: from pps.filterd (mhs401ykf.rim.net [127.0.0.1])
 by mhs401ykf.rim.net (8.16.0.27/8.16.0.27) with SMTP id 002JCA35114997;
 Thu, 2 Jan 2020 14:12:10 -0500
Received: from xct102cnc.rim.net (xct102cnc.rim.net [10.65.161.202])
 by mhs401ykf.rim.net with ESMTP id 2x9p5h80v6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 02 Jan 2020 14:12:10 -0500
Received: from XCH210YKF.rim.net (10.2.27.110) by XCT102CNC.rim.net
 (10.65.161.202) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 2 Jan
 2020 14:12:09 -0500
Received: from XCH212YKF.rim.net (10.2.27.112) by XCH210YKF.rim.net
 (10.2.27.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Thu, 2 Jan 2020
 14:12:08 -0500
Received: from XCH212YKF.rim.net ([fe80::f8d6:5212:cc30:f538]) by
 XCH212YKF.rim.net ([fe80::f8d6:5212:cc30:f538%5]) with mapi id
 15.01.1847.003; Thu, 2 Jan 2020 14:12:08 -0500
From: Rudolf Streif <rstreif@blackberry.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>
Subject: [PATCH] virtio_input: Initialize multi-touch slots on ABS_MT_SLOT
Thread-Topic: [PATCH] virtio_input: Initialize multi-touch slots on ABS_MT_SLOT
Thread-Index: AQHVwZ/yVQsi8tG5E0eaQ5YiNoZxKQ==
Date: Thu, 2 Jan 2020 19:12:08 +0000
Message-ID: <cbf254cbfde249b99f275a38c5c8cc97@blackberry.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [100.64.97.181]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2020-01-02_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1911140001 definitions=main-2001020155
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6518213072025702533=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============6518213072025702533==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_cbf254cbfde249b99f275a38c5c8cc97blackberrycom_"

--_000_cbf254cbfde249b99f275a38c5c8cc97blackberrycom_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

For multi-touch devices the frontend needs to initialize the correct
number of slots for touch tracking. Hardware drivers do this by
calling input_mt_init_slots() on initialization. For virtio_input
the function must be called when the backend sends ABS_MT_SLOT.

Signed-off-by: Rudolf J Streif <rstreif@blackberry.com>
---
 drivers/virtio/virtio_input.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index 5ae529671b3d..582ba808b955 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -3,6 +3,7 @@
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/input.h>
+#include <linux/input/mt.h>

 #include <uapi/linux/virtio_ids.h>
 #include <uapi/linux/virtio_input.h>
@@ -164,6 +165,9 @@ static void virtinput_cfg_abs(struct virtio_input *vi, =
int abs)
        virtio_cread(vi->vdev, struct virtio_input_config, u.abs.flat, &fl);
        input_set_abs_params(vi->idev, abs, mi, ma, fu, fl);
        input_abs_set_res(vi->idev, abs, re);
+
+       if (abs =3D=3D ABS_MT_SLOT)
+               input_mt_init_slots(vi->idev, ma + 1, INPUT_MT_DIRECT | INP=
UT_MT_DROP_UNUSED);
 }

 static int virtinput_init_vqs(struct virtio_input *vi)
--
2.17.1


----------------------------------------------------------------------
This transmission (including any attachments) may contain confidential info=
rmation, privileged material (including material protected by the solicitor=
-client or other applicable privileges), or constitute non-public informati=
on. Any use of this information by anyone other than the intended recipient=
 is prohibited. If you have received this transmission in error, please imm=
ediately reply to the sender and delete this information from your system. =
Use, dissemination, distribution, or reproduction of this transmission by u=
nintended recipients is not authorized and may be unlawful.

--_000_cbf254cbfde249b99f275a38c5c8cc97blackberrycom_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="iso-8859-1"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p></p>
<div>For multi-touch devices the frontend needs to initialize the correct<b=
r>
number of slots for touch tracking. Hardware drivers do this by<br>
calling input_mt_init_slots() on initialization. For virtio_input<br>
the function must be called when the backend sends ABS_MT_SLOT.<br>
<br>
Signed-off-by: Rudolf J Streif &lt;rstreif@blackberry.com&gt;<br>
---<br>
&nbsp;drivers/virtio/virtio_input.c | 4 &#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 4 insertions(&#43;)<br>
<br>
diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c<=
br>
index 5ae529671b3d..582ba808b955 100644<br>
--- a/drivers/virtio/virtio_input.c<br>
&#43;&#43;&#43; b/drivers/virtio/virtio_input.c<br>
@@ -3,6 &#43;3,7 @@<br>
&nbsp;#include &lt;linux/virtio.h&gt;<br>
&nbsp;#include &lt;linux/virtio_config.h&gt;<br>
&nbsp;#include &lt;linux/input.h&gt;<br>
&#43;#include &lt;linux/input/mt.h&gt;<br>
<br>
&nbsp;#include &lt;uapi/linux/virtio_ids.h&gt;<br>
&nbsp;#include &lt;uapi/linux/virtio_input.h&gt;<br>
@@ -164,6 &#43;165,9 @@ static void virtinput_cfg_abs(struct virtio_input *=
vi, int abs)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; virtio_cread(vi-&gt;vdev, struct=
 virtio_input_config, u.abs.flat, &amp;fl);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; input_set_abs_params(vi-&gt;idev=
, abs, mi, ma, fu, fl);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; input_abs_set_res(vi-&gt;idev, a=
bs, re);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (abs =3D=3D ABS_MT_SLOT)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; input_mt_init_slots(vi-&gt;idev, ma &#43; 1, INPUT_MT_DIRECT=
 | INPUT_MT_DROP_UNUSED);<br>
&nbsp;}<br>
<br>
&nbsp;static int virtinput_init_vqs(struct virtio_input *vi)<br>
-- <br>
2.17.1<br>
<br>
</div>
<br>
<p></p>
</div>

<HR>This transmission (including any attachments) may contain confidential =
information, privileged material (including material protected by the solic=
itor-client or other applicable privileges), or constitute non-public infor=
mation. Any use of this information by anyone other than the intended recip=
ient is prohibited. If you have received this transmission in error, please=
 immediately reply to the sender and delete this information from your syst=
em. Use, dissemination, distribution, or reproduction of this transmission =
by unintended recipients is not authorized and may be unlawful.<BR>
</body>
</html>

--_000_cbf254cbfde249b99f275a38c5c8cc97blackberrycom_--

--===============6518213072025702533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============6518213072025702533==--
