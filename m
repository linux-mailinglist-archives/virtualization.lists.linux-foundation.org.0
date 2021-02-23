Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BCABB3228A6
	for <lists.virtualization@lfdr.de>; Tue, 23 Feb 2021 11:13:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73F1B86F12;
	Tue, 23 Feb 2021 10:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNPKd8+FlTG4; Tue, 23 Feb 2021 10:13:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4CE3986EB1;
	Tue, 23 Feb 2021 10:13:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12EB7C000A;
	Tue, 23 Feb 2021 10:13:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE58FC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 10:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 931CD8538A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 10:13:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T97OTR4ckz2U
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 10:13:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 13C7C84F61
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 10:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614075200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m1evG5Ib2Q2z0f8vZTqJ5w2p3Evm2IzZoU+LvOAkYKY=;
 b=PFD48Es6jCxv9amd6mP7fBGrlRxgBerV2zvAbW5/hml03oCN5EMVYNeZo0Fu0/L4+Uuzfp
 4SIr3W9zrgf5jpvURIgfxcv5g+SjiVRZWvmkme/NyuD6fbZZKVqWn3+dvNACsUuB0DInQj
 UZrWnQX6sYjf1I7R5GOLCT4z/lxEgo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-Bxkvr_rsPVuy2KVv4HkeVw-1; Tue, 23 Feb 2021 05:13:16 -0500
X-MC-Unique: Bxkvr_rsPVuy2KVv4HkeVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A87741084CB9;
 Tue, 23 Feb 2021 10:13:14 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-193.pek2.redhat.com
 [10.72.12.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BE9F68D23;
 Tue, 23 Feb 2021 10:13:08 +0000 (UTC)
Subject: Re: [PATCH v2] vhost vdpa: fix the missing
 irq_bypass_unregister_producer() invocation
To: Gautam Dawar <gdawar.xilinx@gmail.com>,
 virtualization@lists.linux-foundation.org, mst@redhat.com,
 gdawar@xilinx.com, martinh@xilinx.com, hanand@xilinx.com
References: <CAJ-rMYpFFD0vwERMbj_tMLmeFqECr0Q+s4ct_sO0AAt3rgWG0Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a9ee01e4-50ea-8b6a-e078-8b2902efce1b@redhat.com>
Date: Tue, 23 Feb 2021 18:13:06 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAJ-rMYpFFD0vwERMbj_tMLmeFqECr0Q+s4ct_sO0AAt3rgWG0Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
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
Content-Type: multipart/mixed; boundary="===============5891964216832204249=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is a multi-part message in MIME format.
--===============5891964216832204249==
Content-Type: multipart/alternative;
 boundary="------------65466C39E908FD7E2242A482"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------65466C39E908FD7E2242A482
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/2/23 6:00 下午, Gautam Dawar wrote:
> When qemu with vhost-vdpa netdevice is run for the first time, it 
> works well.
> But after the VM is powered off, the next qemu run causes kernel panic 
> due to a
> NULL pointer dereference in irq_bypass_register_producer().
>
> When the VM is powered off, vhost_vdpa_clean_irq() misses on calling
> irq_bypass_unregister_producer() for irq 0 because of the existing check.
>
> This leaves stale producer nodes, which are reset in 
> vhost_vring_call_reset()
> when vhost_dev_init() is invoked during the second qemu run.
>
> As the node member of struct irq_bypass_producer is also initialized
> to zero, traversal on the producers list causes crash due to NULL pointer
> dereference.
>
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=211711 
> <https://bugzilla.kernel.org/show_bug.cgi?id=211711>
> Signed-off-by: Gautam Dawar <gdawar@xilinx.com <mailto:gdawar@xilinx.com>>
>
> -----
> changelog:
> v1->v2:
>  - Addressed Jason's comment to remove the irq check and use
>    vhost_vdpa_unsetup_vq_irq() to avoid local variable vq
> -----
>

Acked-by: Jason Wang <jasowang@redhat.com>


>
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 62a9bb0efc55..e00573b87aba 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -844,14 +844,10 @@ static int vhost_vdpa_open(struct inode *inode, 
> struct file *filep)
>
>  static void vhost_vdpa_clean_irq(struct vhost_vdpa *v)
>  {
> -       struct vhost_virtqueue *vq;
>         int i;
>
> -       for (i = 0; i < v->nvqs; i++) {
> -               vq = &v->vqs[i];
> -               if (vq->call_ctx.producer.irq)
> - irq_bypass_unregister_producer(&vq->call_ctx.producer);
> -       }
> +       for (i = 0; i < v->nvqs; i++)
> +               vhost_vdpa_unsetup_vq_irq(v, i);
>  }
>
>  static int vhost_vdpa_release(struct inode *inode, struct file *filep)

--------------65466C39E908FD7E2242A482
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/2/23 6:00 下午, Gautam Dawar
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJ-rMYpFFD0vwERMbj_tMLmeFqECr0Q+s4ct_sO0AAt3rgWG0Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">When qemu with vhost-vdpa netdevice is run for the
        first time, it works well.<br>
        But after the VM is powered off, the next qemu run causes kernel
        panic due to a<br>
        NULL pointer dereference in irq_bypass_register_producer().<br>
        <br>
        When the VM is powered off, vhost_vdpa_clean_irq() misses on
        calling<br>
        irq_bypass_unregister_producer() for irq 0 because of the
        existing check.<br>
        <div><br>
        </div>
        <div>This leaves stale producer nodes, which are reset in
          vhost_vring_call_reset()<br>
          when vhost_dev_init() is invoked during the second qemu run.<br>
          <br>
          As the node member of struct irq_bypass_producer is also
          initialized<br>
          to zero, traversal on the producers list causes crash due to
          NULL pointer<br>
          dereference.<br>
          <br>
          Bugzilla: <a
            href="https://bugzilla.kernel.org/show_bug.cgi?id=211711"
            moz-do-not-send="true">https://bugzilla.kernel.org/show_bug.cgi?id=211711</a><br>
          Signed-off-by: Gautam Dawar &lt;<a
            href="mailto:gdawar@xilinx.com" moz-do-not-send="true">gdawar@xilinx.com</a>&gt;<br>
          <br>
          -----<br>
          changelog:<br>
          v1-&gt;v2:<br>
           - Addressed Jason's comment to remove the irq check and use<br>
             vhost_vdpa_unsetup_vq_irq() to avoid local variable vq<br>
          -----<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Acked-by: Jason Wang <a class="moz-txt-link-rfc2396E" href="mailto:jasowang@redhat.com">&lt;jasowang@redhat.com&gt;</a><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAJ-rMYpFFD0vwERMbj_tMLmeFqECr0Q+s4ct_sO0AAt3rgWG0Q@mail.gmail.com">
      <div dir="ltr">
        <div><br>
          diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c<br>
          index 62a9bb0efc55..e00573b87aba 100644<br>
          --- a/drivers/vhost/vdpa.c<br>
          +++ b/drivers/vhost/vdpa.c<br>
          @@ -844,14 +844,10 @@ static int vhost_vdpa_open(struct inode
          *inode, struct file *filep)<br>
          <br>
           static void vhost_vdpa_clean_irq(struct vhost_vdpa *v)<br>
           {<br>
          -       struct vhost_virtqueue *vq;<br>
                  int i;<br>
          <br>
          -       for (i = 0; i &lt; v-&gt;nvqs; i++) {<br>
          -               vq = &amp;v-&gt;vqs[i];<br>
          -               if (vq-&gt;call_ctx.producer.irq)<br>
          -                      
          irq_bypass_unregister_producer(&amp;vq-&gt;call_ctx.producer);<br>
          -       }<br>
          +       for (i = 0; i &lt; v-&gt;nvqs; i++)<br>
          +               vhost_vdpa_unsetup_vq_irq(v, i);<br>
           }</div>
        <div><br>
        </div>
        <div> static int vhost_vdpa_release(struct inode *inode, struct
          file *filep)<br>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------65466C39E908FD7E2242A482--


--===============5891964216832204249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============5891964216832204249==--

