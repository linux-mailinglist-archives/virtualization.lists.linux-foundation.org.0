Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA901557E5
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 13:39:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 54FAC2049D;
	Fri,  7 Feb 2020 12:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Orw6wKFAr3h5; Fri,  7 Feb 2020 12:39:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9B32B20478;
	Fri,  7 Feb 2020 12:39:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71DC5C013E;
	Fri,  7 Feb 2020 12:39:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75F1AC013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6468620476
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKCngM9DgOOs
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:39:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 940572046C
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581079154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2IwNz7m8EBxgaV/gA8k+cJl/cgQQuSz8wqKKuyY3Q8c=;
 b=fnzqGgso7DgCHMlsnsi9GcC5lJw8X0JJUkzmLU4bWmcd6WdviKB7JAmziOBlKOd2fV4DDK
 MQqIZbClOZt//lnFI6+rRV+iBKyZX0g8Dgr/I1yPvVLQ0ShOYmufDGtTIIT7dvKI+7+Pem
 +VmOTozJmQrUXsdh5cvmAQvKeQ5rvRw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-8tXZMvjUMeS2wSNC7jAClg-1; Fri, 07 Feb 2020 07:39:07 -0500
X-MC-Unique: 8tXZMvjUMeS2wSNC7jAClg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CC52800E21;
 Fri,  7 Feb 2020 12:39:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A617487B1C;
 Fri,  7 Feb 2020 12:39:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E73C5A1E0; Fri,  7 Feb 2020 13:39:04 +0100 (CET)
Date: Fri, 7 Feb 2020 13:39:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/bochs: downgrade pci_request_region failure from
 error to warning
Message-ID: <20200207123904.vvueifnbcfzlb7gx@sirius.home.kraxel.org>
References: <20200207115744.4559-1-kraxel@redhat.com>
 <04783a3f-daae-47a3-d2a7-d42f192daf23@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04783a3f-daae-47a3-d2a7-d42f192daf23@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, marmarek@invisiblethingslab.com,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
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

On Fri, Feb 07, 2020 at 01:06:00PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 07.02.20 um 12:57 schrieb Gerd Hoffmann:
> > Shutdown of firmware framebuffer has a bunch of problems.  Because
> > of this the framebuffer region might still be reserved even after
> > drm_fb_helper_remove_conflicting_pci_framebuffers() returned.
> 
> Out of curiosity: what's going wrong here?

Very short version: userspace keeping /dev/fb0 open delays
firmware framebuffer deinit.

Long version by Daniel Vetter:
https://www.spinics.net/lists/linux-fbdev/msg28178.html

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
