Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 246DF3212D9
	for <lists.virtualization@lfdr.de>; Mon, 22 Feb 2021 10:13:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7D3CA85DF4;
	Mon, 22 Feb 2021 09:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J9-eMz88XVSD; Mon, 22 Feb 2021 09:13:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D0A985D44;
	Mon, 22 Feb 2021 09:13:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4365EC0001;
	Mon, 22 Feb 2021 09:13:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9C04C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 09:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F5586F54A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 09:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VqvsGybDR2o0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 09:13:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 132406F53F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 09:13:38 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id w1so13328756oic.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 01:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tjwvZbE86+00VYkctOTCqBhB3zQLvgy9ePM0pylWJF8=;
 b=e6x6cTpUe/n89Wyp09bbB+eFKXYRK9U5Qlpmt0+M//rFwOAkIwrljwYOTywYfRP76D
 aPeTu1Tpltuvi3NbV/MFCPHljtt15Aw7n0L8htgYmQh4vJ6CwUZ+rQWM/TdvBw2CMsDb
 mBgyx/V1Ps2KZqpe8lyqIi7h+PZUTXnUR8iWYqesyRc8uNOa7vKoaHVMRp1boRXqMADp
 HJgCi6yCzJqbL5c/f+zdq4Jtya6GOSdC2exS9okIWEWN0lTLptve1rF3m7lz6TR9YmWU
 EBASkKae1SY86RwqTeUBL0Hmms6SeFbgwGvvcpvtfOcDSARnPyAE99pVKpaTArMOYGxc
 yuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tjwvZbE86+00VYkctOTCqBhB3zQLvgy9ePM0pylWJF8=;
 b=UKX0aWdDOSSgOF+O+4k2fWaW4iA+cCAvbZ03aOrRoZIx92FrFnHqxDxRuC4OV6Xea9
 iwATSlllk5E26KppDrc6l21jRwKnabI/qGrfZkg2FevNbtqjKyf/8hubcZgEL1RcEm27
 l7kGpqOJuLwPbZvXIQlrd+4QglZdcIKrsGnymd/WZCqq5vb0mwo6oUmLrWmtAEaRZYHz
 Uy7hxEEULdpnVdqVHrYhTxJS+cfETbNXnhw7UkYJ3ADP7SQsiONjKNdnQgjP2/NHnNcC
 6NgmHbSQrCGuRKrGGGuhtMCIH66Rx+ePcNvgntVvhdtJ5/0ZOeB57IyJbLc3IexK/G5Z
 emYQ==
X-Gm-Message-State: AOAM531tcHizP5GG7Nb7TVYXtnidruPdJbizhoCkXCfSDiFibKYQRDky
 bXyFk2f46IoB8gIUzJ22BHmRL6Xgh/JaCpi4hKc=
X-Google-Smtp-Source: ABdhPJzlc8Fhhx/OtZdYhq3grOrYsoLy8OUq4uhOr+FM7KVSmprsMWXp+XnrwLYQAjmZ789mJl/X7bbW5Vd3U9q9d1Y=
X-Received: by 2002:aca:aa96:: with SMTP id t144mr5252763oie.131.1613985218049; 
 Mon, 22 Feb 2021 01:13:38 -0800 (PST)
MIME-Version: 1.0
From: Gautam Dawar <gdawar.xilinx@gmail.com>
Date: Mon, 22 Feb 2021 14:43:27 +0530
Message-ID: <CAJ-rMYrf8ZBAHaxd51q2c5GVLEfpwgE26RpmGrr=pg7syeSfNw@mail.gmail.com>
Subject: [PATCH] vhost vdpa: fix the irq check for invoking
 irq_bypass_unregister_producer
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, gdawar@xilinx.com, 
 hanand@xilinx.com, martinh@xilinx.com, 
 virtualization@lists.linux-foundation.org
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
Content-Type: multipart/mixed; boundary="===============4504658690611324741=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--===============4504658690611324741==
Content-Type: multipart/alternative; boundary="00000000000098386f05bbe937d0"

--00000000000098386f05bbe937d0
Content-Type: text/plain; charset="UTF-8"

When qemu with vhost-vdpa netdevice is run for the first time, it works
well.
But after the VM is powered off, the next qemu run causes kernel panic due
to
a NULL pointer dereference in irq_bypass_register_producer().

When the VM is powered off, vhost_vdpa_clean_irq() misses on calling
irq_bypass_unregister_producer() for irq 0 because of the existing check.

This leaves stale producer nodes, which are reset in
vhost_vring_call_reset()
when vhost_dev_init() is invoked during the second qemu run.

As the node member of struct irq_bypass_producer is also initialized
to zero, traversal on the producers list causes crash due to NULL pointer
dereference.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=211711
Signed-off-by: Gautam Dawar <gdawar@xilinx.com>


diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 62a9bb0efc55..d1c3a33c6239 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -849,7 +849,7 @@ static void vhost_vdpa_clean_irq(struct vhost_vdpa *v)

        for (i = 0; i < v->nvqs; i++) {
                vq = &v->vqs[i];
-               if (vq->call_ctx.producer.irq)
+               if (vq->call_ctx.producer.irq >= 0)

irq_bypass_unregister_producer(&vq->call_ctx.producer);
        }
 }

--00000000000098386f05bbe937d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">When qemu with vhost-vdpa netdevice is run for the first t=
ime, it works well.<br>But after the VM is powered off, the next qemu run c=
auses kernel panic due to<br>a NULL pointer dereference in irq_bypass_regis=
ter_producer().<br><br>When the VM is powered off, vhost_vdpa_clean_irq() m=
isses on calling<br>irq_bypass_unregister_producer() for irq 0 because of t=
he existing check.<br><br>This leaves stale producer nodes, which are reset=
 in vhost_vring_call_reset()<br>when vhost_dev_init() is invoked during the=
 second qemu run.<br><br>As the node member of struct irq_bypass_producer i=
s also initialized<br>to zero, traversal on the producers list causes crash=
 due to NULL pointer<br>dereference.<br><br>Bugzilla: <a href=3D"https://bu=
gzilla.kernel.org/show_bug.cgi?id=3D211711">https://bugzilla.kernel.org/sho=
w_bug.cgi?id=3D211711</a><div>Signed-off-by: Gautam Dawar &lt;<a href=3D"ma=
ilto:gdawar@xilinx.com">gdawar@xilinx.com</a>&gt;<br></div><div><br></div><=
div><br>diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c<br>index 6=
2a9bb0efc55..d1c3a33c6239 100644<br>--- a/drivers/vhost/vdpa.c<br>+++ b/dri=
vers/vhost/vdpa.c<br>@@ -849,7 +849,7 @@ static void vhost_vdpa_clean_irq(s=
truct vhost_vdpa *v)<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt=
; v-&gt;nvqs; i++) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 vq =3D &amp;v-&gt;vqs[i];<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (vq-&gt;call_ctx.producer.irq)<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (vq-&gt;call_ctx.producer.irq &gt;=3D 0)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 irq_bypass_unregister_producer(&amp;vq-&gt;call_ctx.producer);<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0}<br></div></div>

--00000000000098386f05bbe937d0--

--===============4504658690611324741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============4504658690611324741==--
