Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 211431BBAF3
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 12:16:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 50C2487E8A;
	Tue, 28 Apr 2020 10:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aOtFmyoGHly; Tue, 28 Apr 2020 10:08:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D538C87E81;
	Tue, 28 Apr 2020 10:08:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B19CEC0172;
	Tue, 28 Apr 2020 10:08:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 153FFC0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E6C8B20354
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xl+MKbNWsHcd
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:08:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 0732E20107
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588068517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1SF8MUlD9hfU+J1tu6ygb1dTfS8oiUptngKhlqv8uzM=;
 b=GpyhVK2gbQkk377uI1y/C5eTAFZkk/Q/+ENCi5dpyJOHZ4AnlfxV2QOHOgiVsgT2CoAwdT
 UdvHTOzyCUWb6Rtyi5Z5fpwnABuyBvRXbP1BL5NPc0LFxTAXZznUZ4jbCMImkEuoZybpX8
 L1XvFJqeNK+/i4xExlFBmDMkA5sPcUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-i9eRR77nP2uZiUf26ZEegg-1; Tue, 28 Apr 2020 06:08:34 -0400
X-MC-Unique: i9eRR77nP2uZiUf26ZEegg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE5921005510;
 Tue, 28 Apr 2020 10:08:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 885A55D9E2;
 Tue, 28 Apr 2020 10:08:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 62B4C9D98; Tue, 28 Apr 2020 12:08:31 +0200 (CEST)
Date: Tue, 28 Apr 2020 12:08:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vasily Averin <vvs@virtuozzo.com>
Subject: Re: [PATCH] drm/qxl: lost qxl_bo_kunmap_atomic_page in
 qxl_image_init_helper()
Message-ID: <20200428100831.a4525pdp335ffkgi@sirius.home.kraxel.org>
References: <d0d96600-b147-0c44-f551-97a66083518d@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <d0d96600-b147-0c44-f551-97a66083518d@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
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

On Mon, Apr 27, 2020 at 10:55:27AM +0300, Vasily Averin wrote:
> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>
> ---
>  drivers/gpu/drm/qxl/qxl_image.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/qxl/qxl_image.c b/drivers/gpu/drm/qxl/qxl_image.c
> index 43688ecdd8a0..7270da62fc29 100644
> --- a/drivers/gpu/drm/qxl/qxl_image.c
> +++ b/drivers/gpu/drm/qxl/qxl_image.c
> @@ -212,6 +212,7 @@ qxl_image_init_helper(struct qxl_device *qdev,
>  		break;
>  	default:
>  		DRM_ERROR("unsupported image bit depth\n");
> +		qxl_bo_kunmap_atomic_page(qdev, image_bo, ptr);
>  		return -EINVAL; /* TODO: cleanup */

I guess you can ditch the TODO comment now, it's done ;)

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
