Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A01F91BBABC
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 12:07:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3FBE7226A0;
	Tue, 28 Apr 2020 10:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I-8UuPHy7r0w; Tue, 28 Apr 2020 10:07:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A0E3D2262B;
	Tue, 28 Apr 2020 10:07:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F92EC0172;
	Tue, 28 Apr 2020 10:07:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44540C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4051686BB9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OXIM6CRP5kek
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:07:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 20C578672C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 10:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588068453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kFmEp4x5VBolAgBTL4l/jIDaFGl21v1uu2wIkG+bq1A=;
 b=cSXccEcyBkNzbgGP9/wD2kHn+l02M/DvXXnbUolBACg5NFkAMRL6tncjCoNxHj2RRE0PaG
 5p9Uk1EfgcAmn39y8cs2oB5xI/bqZjzQReyJEcte9ENYWLiHARRYWBcIU1NF0ZTQySvOU9
 S+sTBjKcmjHZbXKNxvZryVr7akBNVaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-zT7iwfZPMvq3C3hLYan8Bw-1; Tue, 28 Apr 2020 06:07:32 -0400
X-MC-Unique: zT7iwfZPMvq3C3hLYan8Bw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C04C8800D24;
 Tue, 28 Apr 2020 10:07:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0D9C277A5;
 Tue, 28 Apr 2020 10:07:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E2D639D98; Tue, 28 Apr 2020 12:07:28 +0200 (CEST)
Date: Tue, 28 Apr 2020 12:07:28 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vasily Averin <vvs@virtuozzo.com>
Subject: Re: [PATCH 2/2] drm/qxl: qxl_release leak in qxl_hw_surface_alloc()
Message-ID: <20200428100728.z5j3trkwgksxm2w5@sirius.home.kraxel.org>
References: <2e5a13ae-9ab2-5401-aa4d-03d5f5593423@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <2e5a13ae-9ab2-5401-aa4d-03d5f5593423@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 OpenVZ devel <devel@openvz.org>
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

On Mon, Apr 27, 2020 at 08:32:51AM +0300, Vasily Averin wrote:
> Cc: stable@vger.kernel.org
> Fixes: 8002db6336dd ("qxl: convert qxl driver to proper use for reservations")
> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>

Both patches pushed to drm-misc-fixes.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
