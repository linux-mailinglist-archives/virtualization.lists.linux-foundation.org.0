Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 26167169FDE
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 09:18:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 744E3204E0;
	Mon, 24 Feb 2020 08:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNTnlr0Yvz0r; Mon, 24 Feb 2020 08:18:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0081E204DB;
	Mon, 24 Feb 2020 08:18:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA3A3C18DA;
	Mon, 24 Feb 2020 08:18:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 417F3C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 08:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 278DE86111
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 08:18:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EuANhU+GVT3V
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 08:18:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 47663860FC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582532299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=26ujGlHWi7PJKO4alHamqkoVhqyWoDiMPEKCVW/RC9k=;
 b=fLIRfmIRdkmLkcaq+l7ENYk/ewmZjKBt8ovMtwV+AMLchxkRT9KyYgTcCNX+2AriwlIeLd
 ItQCwSMCYAlhwu+NxqaEF9dkSq4omRdowMozCL1AfxLLdgAhtQHkpeFLsOp+uE0Cn2ge7z
 mYQEd+BiCIRrip9E89VDp4GYu9isyp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-WXXZvRYhMXuKN6VHHoNHsg-1; Mon, 24 Feb 2020 03:18:17 -0500
X-MC-Unique: WXXZvRYhMXuKN6VHHoNHsg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A2B3801E5C;
 Mon, 24 Feb 2020 08:18:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-87.ams2.redhat.com
 [10.36.116.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26FFD60BF3;
 Mon, 24 Feb 2020 08:18:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 798971747F; Mon, 24 Feb 2020 09:18:14 +0100 (CET)
Date: Mon, 24 Feb 2020 09:18:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 31/52] drm/cirrus: Fully embrace devm_
Message-ID: <20200224081814.fupiz5lo35vmvma4@sirius.home.kraxel.org>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-32-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200219102122.1607365-32-daniel.vetter@ffwll.ch>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Feb 19, 2020 at 11:21:01AM +0100, Daniel Vetter wrote:
> With the drm_device lifetime fun cleaned up there's nothing in the way
> anymore to use devm_ for everything hw releated. Do it, and in the
> process, throw out the entire onion unwinding.
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: virtualization@lists.linux-foundation.org

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
