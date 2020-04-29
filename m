Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0141BDAD7
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 13:40:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B58B8781C;
	Wed, 29 Apr 2020 11:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQ6kX-jmRTuz; Wed, 29 Apr 2020 11:40:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA6F48781E;
	Wed, 29 Apr 2020 11:40:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D837C0172;
	Wed, 29 Apr 2020 11:40:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77299C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 11:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5F2E223086
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 11:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vual6fY9EZwQ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 11:40:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 6A9BC2302C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588160409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i5Je+1Dc64rZtTjouuURw7sak090c/6L3UB9TPdH924=;
 b=Bl7OjuPGpjPbZMyvocrgCqEEtrtkWzlDb8X/40hGCcYAA/c8j7EipMoj5V3zMF/ZUaQeJF
 TrahLUq56Osdoujw4AyN28+kRbxuVJteTCOA9om2M5QgbP5a0PJ7SoYefrJt9Dih7RMZ2j
 QNF0NLHelytjRaxvDK0usXgT/EalbvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-kggWqf7OMTmb1_CVmQuQ8Q-1; Wed, 29 Apr 2020 07:40:07 -0400
X-MC-Unique: kggWqf7OMTmb1_CVmQuQ8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48474835B40;
 Wed, 29 Apr 2020 11:40:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA04660BF4;
 Wed, 29 Apr 2020 11:40:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B87B31753B; Wed, 29 Apr 2020 13:40:01 +0200 (CEST)
Date: Wed, 29 Apr 2020 13:40:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vasily Averin <vvs@virtuozzo.com>
Subject: Re: [PATCH] drm/qxl: qxl_release use after free
Message-ID: <20200429114001.k4yhfssob7l6otnk@sirius.home.kraxel.org>
References: <20200429082837.uedcapxmennuc5a2@sirius.home.kraxel.org>
 <fa17b338-66ae-f299-68fe-8d32419d9071@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <fa17b338-66ae-f299-68fe-8d32419d9071@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Caicai <caizhaopeng@uniontech.com>
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

On Wed, Apr 29, 2020 at 12:01:24PM +0300, Vasily Averin wrote:
> qxl_release should not be accesses after qxl_push_*_ring_release() calls:
> userspace driver can process submitted command quickly, move qxl_release
> into release_ring, generate interrupt and trigger garbage collector.
> 
> It can lead to crashes in qxl driver or trigger memory corruption
> in some kmalloc-192 slab object
> 
> Gerd Hoffmann proposes to swap the qxl_release_fence_buffer_objects() +
> qxl_push_{cursor,command}_ring_release() calls to close that race window.
> 
> cc: stable@vger.kernel.org
> Fixes: f64122c1f6ad ("drm: add new QXL driver. (v1.4)")
> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>

Pushed to drm-misc-fixes.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
