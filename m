Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47E19F07E
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 08:55:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BB23622C1A;
	Mon,  6 Apr 2020 06:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czkNu4xp2Gg5; Mon,  6 Apr 2020 06:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 266CA22FEE;
	Mon,  6 Apr 2020 06:55:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10168C0177;
	Mon,  6 Apr 2020 06:55:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 261CBC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 06:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1529322C1A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 06:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2fOktIhL2i12
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 06:55:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id D3623226FF
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 06:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586156123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+DuuhWh5WS/zqYHNwoD712nIR0gIu2uvaH38DF6AVX8=;
 b=USTq9NpQ0QaUR0f8TE0ZQrkRULIxjcOTo4Pm6aYcrNeoz/gJoM1j0rebNExJiQDPEtTA2j
 ZaoWva1t6L2DM01tLdc+ccK21ST/hH8Zp4y+1MuErOWDlszYnSPJUjiGTR4L3VC/VlcGKF
 iwnPW7a9WW6l2TPh+ZB2VLK13sGp+Pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-0dmzAn_mPAKouxlVuZ8OJw-1; Mon, 06 Apr 2020 02:55:21 -0400
X-MC-Unique: 0dmzAn_mPAKouxlVuZ8OJw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AD931005509;
 Mon,  6 Apr 2020 06:55:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-60.ams2.redhat.com
 [10.36.113.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C94C90CE0;
 Mon,  6 Apr 2020 06:55:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 99F881750C; Mon,  6 Apr 2020 08:55:19 +0200 (CEST)
Date: Mon, 6 Apr 2020 08:55:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 31/44] drm/qxl: Don't use drm_device->dev_private
Message-ID: <20200406065519.b6xj6gbn7y3sjr5h@sirius.home.kraxel.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-32-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200403135828.2542770-32-daniel.vetter@ffwll.ch>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
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

On Fri, Apr 03, 2020 at 03:58:15PM +0200, Daniel Vetter wrote:
> Upcasting using a container_of macro is more typesafe, faster and
> easier for the compiler to optimize.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
