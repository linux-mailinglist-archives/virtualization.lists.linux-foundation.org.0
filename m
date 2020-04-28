Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B03B1BBAE4
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 12:13:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 405EE84995;
	Tue, 28 Apr 2020 10:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NIJRi1T3pzmQ; Tue, 28 Apr 2020 10:13:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 93876848A9;
	Tue, 28 Apr 2020 10:13:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7562DC0172;
	Tue, 28 Apr 2020 10:13:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C1F3C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1C32E2155C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nFTilQ-DFIx6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:13:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 60A3620360
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588068824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VkboMkRfJGi+VpgKb0XYw5D6JHs33QiJoJ1qwmUiARg=;
 b=RnVlar0lDCgLKi785Uu1qDMGqGEfsIddtnUJ3/M0+U6ie6OFGc+rLARlcCbaQazmHjUnh1
 mRmQimrB11pwyhjbz253Fgjqw1q8v4BxEahkzqbeLNRMwKPU2k1cfJLbq/hj858SLGEvjt
 hvfGi0SJUYcGY19JgzYUbp80Tnkap78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-W8R3EmJeP5y1ahrWUfFB7w-1; Tue, 28 Apr 2020 06:13:42 -0400
X-MC-Unique: W8R3EmJeP5y1ahrWUfFB7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D52EA53;
 Tue, 28 Apr 2020 10:13:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3DE65D753;
 Tue, 28 Apr 2020 10:13:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D7E319D98; Tue, 28 Apr 2020 12:13:37 +0200 (CEST)
Date: Tue, 28 Apr 2020 12:13:37 +0200
From: "kraxel@redhat.com" <kraxel@redhat.com>
To: Rudolf Streif <rstreif@blackberry.com>
Subject: Re: [PATCH] virtio_input: Initialize multi-touch slots on ABS_MT_SLOT
Message-ID: <20200428101337.enz7sni4r2hyujdc@sirius.home.kraxel.org>
References: <cbf254cbfde249b99f275a38c5c8cc97@blackberry.com>
 <b5ebe49b77374d53a6cda0ac98f11560@blackberry.com>
MIME-Version: 1.0
In-Reply-To: <b5ebe49b77374d53a6cda0ac98f11560@blackberry.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "mst@redhat.com" <mst@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Apr 15, 2020 at 12:24:12AM +0000, Rudolf Streif wrote:
> Resubmit. Thank you.

Better re-send with "git send-email" as new message.
As reply in an existing thread it gets lost easily.

> ________________________________
> From: Virtualization <virtualization-bounces@lists.linux-foundation.org> on behalf of Rudolf Streif <rstreif@blackberry.com>
> Sent: Thursday, January 2, 2020 11:12 AM
> To: kraxel@redhat.com
> Cc: virtualization@lists.linux-foundation.org
> Subject: [PATCH] virtio_input: Initialize multi-touch slots on ABS_MT_SLOT
> 
> 
> For multi-touch devices the frontend needs to initialize the correct
> number of slots for touch tracking. Hardware drivers do this by
> calling input_mt_init_slots() on initialization. For virtio_input
> the function must be called when the backend sends ABS_MT_SLOT.
> 
> Signed-off-by: Rudolf J Streif <rstreif@blackberry.com>
> ---
>  drivers/virtio/virtio_input.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
> index 5ae529671b3d..582ba808b955 100644
> --- a/drivers/virtio/virtio_input.c
> +++ b/drivers/virtio/virtio_input.c
> @@ -3,6 +3,7 @@
>  #include <linux/virtio.h>
>  #include <linux/virtio_config.h>
>  #include <linux/input.h>
> +#include <linux/input/mt.h>
> 
>  #include <uapi/linux/virtio_ids.h>
>  #include <uapi/linux/virtio_input.h>
> @@ -164,6 +165,9 @@ static void virtinput_cfg_abs(struct virtio_input *vi, int abs)
>         virtio_cread(vi->vdev, struct virtio_input_config, u.abs.flat, &fl);
>         input_set_abs_params(vi->idev, abs, mi, ma, fu, fl);
>         input_abs_set_res(vi->idev, abs, re);
> +
> +       if (abs == ABS_MT_SLOT)
> +               input_mt_init_slots(vi->idev, ma + 1, INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

mst, can you pick it up?

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
