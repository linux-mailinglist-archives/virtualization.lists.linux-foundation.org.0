Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFC531E79F
	for <lists.virtualization@lfdr.de>; Thu, 18 Feb 2021 09:48:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D6DF861C8;
	Thu, 18 Feb 2021 08:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 92Q7f7v6XNnq; Thu, 18 Feb 2021 08:48:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 856ED861C7;
	Thu, 18 Feb 2021 08:48:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55338C000D;
	Thu, 18 Feb 2021 08:48:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A385C000D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Feb 2021 08:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B3D560590
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Feb 2021 08:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahwPkV4vGv5g
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Feb 2021 08:48:39 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id B0ED460593; Thu, 18 Feb 2021 08:48:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E696660590
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Feb 2021 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613638112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y0mWUAsWnwtznXZjCEkaT27WyiYAmUTbw0L3Qn/5Un0=;
 b=hXtRIocZu4NmTIiPhtaB5fd2gO8LYG1cFgFh/iEe0dS4CVa3ko10AdEyVWblRb3o5f8gQ5
 6xCBGSP8MgpLAgsTZVRTnIMnWVG5IkLhsda8+qOE+WKwyTovHxafAnmUUzfmldl2mLdlNv
 10BpTfCaIeX8gU4ALRBUbiZUmLJ1R08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-Ke4uAPfLM_u7hNtF-2TwSw-1; Thu, 18 Feb 2021 03:48:27 -0500
X-MC-Unique: Ke4uAPfLM_u7hNtF-2TwSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48697803F49;
 Thu, 18 Feb 2021 08:48:26 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-38.pek2.redhat.com
 [10.72.13.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C07745D9C2;
 Thu, 18 Feb 2021 08:48:19 +0000 (UTC)
Subject: Re: Kernel panic with vhost-vdpa
To: Gautam Dawar <gdawar.xilinx@gmail.com>,
 virtualization@lists.linux-foundation.org, mst@redhat.com
References: <CAJ-rMYoK9k=z0q7Dv9pJTDUxGJL5UiKhy1RERqCiTSL-qsFNHw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <f5028d5b-bbdf-b548-9d0e-939ee549c695@redhat.com>
Date: Thu, 18 Feb 2021 16:48:18 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAJ-rMYoK9k=z0q7Dv9pJTDUxGJL5UiKhy1RERqCiTSL-qsFNHw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Cc: martinh@xilinx.com, hanand@xilinx.com, gdawar@xilinx.com
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
Content-Type: multipart/mixed; boundary="===============8957855723455712078=="
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

This is a multi-part message in MIME format.
--===============8957855723455712078==
Content-Type: multipart/alternative;
 boundary="------------DC66C5AA10BA85D8D43F35D0"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------DC66C5AA10BA85D8D43F35D0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Gautam:

On 2021/2/15 9:01 下午, Gautam Dawar wrote:
>
> Hi Jason/Michael,
>
> I observed a kernel panic while testing vhost-vdpa with Xilinx 
> adapters. Here are the details for your review:
>
> Problem statement:
>
> When qemu with vhost-vdpa netdevice is run for the first time, it 
> works well. But after the VM is powered off, next qemu run causes 
> kernel panic due to a NULL pointer dereference in 
> irq_bypass_register_producer().
>
> Root cause analysis:
>
> When the VM is powered off, vhost_dev_stop() is invoked which in turn 
> calls vhost_vdpa_reset_device() causing the irq_bypass producers to be 
> unregistered.
>
> On the next run, when qemu opens the vhost device, the 
> vhost_vdpa_open() file operation calls vhost_dev_init(). Here, 
> call_ctx->producer memory is cleared in vhost_vring_call_reset().
>
> Further, when the virtqueues are initialized by 
> vhost_virtqueue_init(), vhost_vdpa_setup_vq_irq() again registers the 
> irq_bypass producer for each virtqueue. As the node member of struct 
> irq_bypass_producer is also initialized to zero, traversal on the 
> producers list causes crash due to NULL pointer dereference.
>

Thanks a lot for reporting this issue.


> Fix details:
>
> I think that this issue can be fixed by invoking 
> vhost_vdpa_setup_vq_irq() only when vhost_vdpa_set_status() includes 
> VIRTIO_CONFIG_S_DRIVER_OK in the new status value. This way, there 
> won’t be any stale nodes in the irqbypass  module’s producers list 
> which are reset in vhost_vring_call_reset().
>
> Patch:
>
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c index 
> 62a9bb0efc55..fdad94e2fbf9 100644
>
> --- a/drivers/vhost/vdpa.c
>
> +++ b/drivers/vhost/vdpa.c
>
> @@ -409,7 +409,6 @@ static long vhost_vdpa_vring_ioctl(struct 
> vhost_vdpa *v, unsigned int cmd,
>
> cb.private = NULL;
>
> }
>
> ops->set_vq_cb(vdpa, idx, &cb);
>
> - vhost_vdpa_setup_vq_irq(v, idx);
>
> break;
>
> case VHOST_SET_VRING_NUM:
>
> We can also track this issue in Bugzilla ticket 21171 
> (https://bugzilla.kernel.org/show_bug.cgi?id=211711 
> <https://bugzilla.kernel.org/show_bug.cgi?id=211711>) and the complete 
> patch is attached with this email.
>

So vhost supports to remove or switch eventfd through 
vhost_vdpa_vring_ioctl(). So if userspace want to switch to another 
eventfd, we should re-do the register and unregister.

I think we need to deal this issue in another way. Can we check whether 
or not the producer is initialized before?

Thanks


> Regards,
>
> Gautam Dawar
>

--------------DC66C5AA10BA85D8D43F35D0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Gautam:<br>
    </p>
    <div class="moz-cite-prefix">On 2021/2/15 9:01 下午, Gautam Dawar
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAJ-rMYoK9k=z0q7Dv9pJTDUxGJL5UiKhy1RERqCiTSL-qsFNHw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">Hi
          Jason/Michael,</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">I
          observed a kernel panic while testing vhost-vdpa with
          Xilinx adapters. Here are the details for your review:</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">Problem
          statement: </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">When
          qemu with vhost-vdpa netdevice is run for the first
          time, it works well. But after the VM is powered off, next
          qemu run causes
          kernel panic due to a NULL pointer dereference in
          irq_bypass_register_producer().</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">Root
          cause analysis:</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">When
          the VM is powered off, vhost_dev_stop() is invoked
          which in turn calls vhost_vdpa_reset_device() causing the
          irq_bypass producers
          to be unregistered.</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">On the
          next run, when qemu opens the vhost device, the
          vhost_vdpa_open() file operation calls vhost_dev_init(). Here,
          call_ctx-&gt;producer
          memory is cleared in vhost_vring_call_reset().</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">Further,
          when the virtqueues are initialized by
          vhost_virtqueue_init(), vhost_vdpa_setup_vq_irq() again
          registers the
          irq_bypass producer for each virtqueue. As the node member of
          struct irq_bypass_producer
          is also initialized to zero, traversal on the producers list
          causes crash due
          to NULL pointer dereference.</p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks a lot for reporting this issue.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAJ-rMYoK9k=z0q7Dv9pJTDUxGJL5UiKhy1RERqCiTSL-qsFNHw@mail.gmail.com">
      <div dir="ltr">
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">Fix
          details:</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">I
          think that this issue can be fixed by invoking
          vhost_vdpa_setup_vq_irq() only when vhost_vdpa_set_status()
          includes
          VIRTIO_CONFIG_S_DRIVER_OK in the new status value. This way,
          there won’t be any
          stale nodes in the irqbypass  module’s
          producers list which are reset in vhost_vring_call_reset().</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">Patch:</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">diff
          --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
          index 62a9bb0efc55..fdad94e2fbf9 100644</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">---
          a/drivers/vhost/vdpa.c</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">+++
          b/drivers/vhost/vdpa.c</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">@@
          -409,7 +409,6 @@ static long
          vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">                       
          cb.private = NULL;</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">               
          }</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">               
          ops-&gt;set_vq_cb(vdpa,
          idx, &amp;cb);</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">-              
          vhost_vdpa_setup_vq_irq(v, idx);</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">               
          break;</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">       
          case
          VHOST_SET_VRING_NUM: </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">We can
          also track this issue in Bugzilla ticket 21171 (<a
            href="https://bugzilla.kernel.org/show_bug.cgi?id=211711"
            style="color:rgb(5,99,193)" moz-do-not-send="true">https://bugzilla.kernel.org/show_bug.cgi?id=211711</a>) 
          and the complete patch is attached with this
          email.</p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>So vhost supports to remove or switch eventfd through
      vhost_vdpa_vring_ioctl(). So if userspace want to switch to
      another eventfd, we should re-do the register and unregister.</p>
    <p>I think we need to deal this issue in another way. Can we check
      whether or not the producer is initialized before?</p>
    <p>Thanks</p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAJ-rMYoK9k=z0q7Dv9pJTDUxGJL5UiKhy1RERqCiTSL-qsFNHw@mail.gmail.com">
      <div dir="ltr">
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif"> </p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">Regards,</p>
        <p class="gmail-MsoPlainText" style="margin:0in 0in
          0.0001pt;font-size:11pt;font-family:Calibri,sans-serif">Gautam
          Dawar</p>
      </div>
    </blockquote>
  </body>
</html>

--------------DC66C5AA10BA85D8D43F35D0--


--===============8957855723455712078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--===============8957855723455712078==--

