Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 062617EE3F
	for <lists.virtualization@lfdr.de>; Fri,  2 Aug 2019 10:02:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8EAE8E5A;
	Fri,  2 Aug 2019 08:02:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 19DDFE46
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 08:02:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D02F3E7
	for <virtualization@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 08:02:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CEE058535D;
	Fri,  2 Aug 2019 08:02:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
	[10.36.116.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C4FF19C68;
	Fri,  2 Aug 2019 08:02:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B04BF16E05; Fri,  2 Aug 2019 10:02:45 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:02:45 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: kick vq outside of the vq lock
Message-ID: <20190802080245.za2n5rgx763xvhpd@sirius.home.kraxel.org>
References: <20190711022937.166015-1-olvaffe@gmail.com>
	<20190711023959.170158-1-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190711023959.170158-1-olvaffe@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 02 Aug 2019 08:02:50 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

> @@ -291,11 +291,9 @@ static int virtio_gpu_queue_ctrl_buffer_locked(struct virtio_gpu_device *vgdev,
>  		trace_virtio_gpu_cmd_queue(vq,
>  			(struct virtio_gpu_ctrl_hdr *)vbuf->buf);
>  
> -		virtqueue_kick(vq);
> +		ret = virtqueue_kick_prepare(vq);
>  	}
>  
> -	if (!ret)
> -		ret = vq->num_free;

Hmm.  Change looks unrelated.

On a closer look it seems this is basically dead code.
virtio_gpu_queue_ctrl_buffer_locked is called by
virtio_gpu_queue_ctrl_buffer and virtio_gpu_queue_fenced_ctrl_buffer.
The call sites for these two functions all ignore the return value.

So it is a valid change, but it should go to a separate patch.  And
while being at it virtio_gpu_queue_ctrl_buffer and
virtio_gpu_queue_fenced_ctrl_buffer can be changed to return void.

Otherwise the patch looks fine.  Nice analysis btw.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
