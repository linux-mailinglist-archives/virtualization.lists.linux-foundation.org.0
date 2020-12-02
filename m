Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B81CA2CB677
	for <lists.virtualization@lfdr.de>; Wed,  2 Dec 2020 09:12:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6708988225;
	Wed,  2 Dec 2020 08:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KltrSB25RlZ3; Wed,  2 Dec 2020 08:12:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 05EC388222;
	Wed,  2 Dec 2020 08:12:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D96CCC0052;
	Wed,  2 Dec 2020 08:12:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45B46C0052
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 08:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 333BE88222
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 08:12:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B2ZJiBxZKLmb
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 08:12:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4728288212
 for <virtualization@lists.linux-foundation.org>;
 Wed,  2 Dec 2020 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H0FfFn+Ish8OF5tVu3W/ZC0N4Vo8H/vl/5w3ii7Oo/0=;
 b=DuhejzYtRZs28BCD4MftQze8/3k2DbgO6t8nutmbwWm9ZSDsnBUvfhU9h+Gp31DDKC5Ci7
 0zkhHtBAgGOGKjv8BHfl/BIZw2Is0SB0p/OH60imnjuut1mHiioXXxd5DaPr2zzV2omu6i
 WEBRLSRL8OGrgVDxXLAD1UXXB6uaWaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-4B4xtEiBPJ6lRcXmFX0iIQ-1; Wed, 02 Dec 2020 03:11:50 -0500
X-MC-Unique: 4B4xtEiBPJ6lRcXmFX0iIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C68ED1006C91;
 Wed,  2 Dec 2020 08:11:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78CF710023AE;
 Wed,  2 Dec 2020 08:11:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6CEF416E31; Wed,  2 Dec 2020 09:11:47 +0100 (CET)
Date: Wed, 2 Dec 2020 09:11:47 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 14/20] drm/qxl: Remove references to struct
 drm_device.pdev
Message-ID: <20201202081147.fhcba7qz4drffaud@sirius.home.kraxel.org>
References: <20201201103542.2182-1-tzimmermann@suse.de>
 <20201201103542.2182-15-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201201103542.2182-15-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Sam Ravnborg <sam@ravnborg.org>, airlied@linux.ie,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch,
 spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
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

On Tue, Dec 01, 2020 at 11:35:36AM +0100, Thomas Zimmermann wrote:
> Using struct drm_device.pdev is deprecated. Convert qxl to struct
> drm_device.dev. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
