Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A3928DACF
	for <lists.virtualization@lfdr.de>; Wed, 14 Oct 2020 10:02:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 24BD387954;
	Wed, 14 Oct 2020 08:02:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgxN8Xb1g3YE; Wed, 14 Oct 2020 08:02:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C460E87969;
	Wed, 14 Oct 2020 08:02:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99D78C0051;
	Wed, 14 Oct 2020 08:02:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E5C0C0051
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Oct 2020 08:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D96DF2E25C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Oct 2020 08:02:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xB074k5aBsZ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Oct 2020 08:02:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by silver.osuosl.org (Postfix) with ESMTPS id DE0E12E24A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Oct 2020 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602662462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pkgGqDcKwPNInWK5gD36RJGreZG4CpyExPIqHD2mYAk=;
 b=Eniv+q1EaRKkRkVaE67ztjezMKfczBLW4lMHfPZWGoBfoxsMgEU7jzRtRPScAxS07fOfGi
 Lg3MhdmJaBlVEdnRbKjgu+yIkWH39M6/wC5FsVvXxfY2BPbcyv5Ds0dkK6AARuT64mP28y
 49otEFTDtZvcQH8kGZfSvr2OsGLMsIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-P3emRcGEOzeVO65d3cimIg-1; Wed, 14 Oct 2020 04:01:00 -0400
X-MC-Unique: P3emRcGEOzeVO65d3cimIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E427879528;
 Wed, 14 Oct 2020 08:00:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 86D127366B;
 Wed, 14 Oct 2020 08:00:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BEAE29CBC; Wed, 14 Oct 2020 10:00:54 +0200 (CEST)
Date: Wed, 14 Oct 2020 10:00:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] drm/virtio: Use UUID API for importing the UUID
Message-ID: <20201014080054.w35hdxsbzjmgktwo@sirius.home.kraxel.org>
References: <20201013132714.70973-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20201013132714.70973-1-andriy.shevchenko@linux.intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 David Stevens <stevensd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>
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

On Tue, Oct 13, 2020 at 04:27:14PM +0300, Andy Shevchenko wrote:
> There is import_uuid() function which imports u8 array to the uuid_t.
> Use it instead of open coding variant.
> 
> This allows to hide the uuid_t internals.
> 
> Reviewed-by: David Stevens <stevensd@chromium.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
