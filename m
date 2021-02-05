Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8346A310749
	for <lists.virtualization@lfdr.de>; Fri,  5 Feb 2021 10:05:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 33B5D8731A;
	Fri,  5 Feb 2021 09:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJD79LP+cJEH; Fri,  5 Feb 2021 09:05:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CF1FA87316;
	Fri,  5 Feb 2021 09:05:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6631C013A;
	Fri,  5 Feb 2021 09:05:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43226C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 09:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2764F2033B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 09:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hUaCryIGRTg
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 09:05:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id DF8572002D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  5 Feb 2021 09:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612515922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2AYOs6/5bOlBAOaNFSpCkmyvWmr96mQQok4N0KBeGT0=;
 b=HcTvx0yjXmDTDsmZgTzxGj286A7qUjBnd5OguKnHG5BiffLBEXCcSmTTPvPGnz/yZfZOUU
 75knKApTxrte9C2X+oft2OPoPLab3uCnM1JSiJP0b37K2kmgxysFHJleNkHRuupQRuocrW
 tHw0JA/js/qYzAwCRXziXyLhZ+iP6B0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-cQluT85NN6yh2SIGcS7UEA-1; Fri, 05 Feb 2021 04:05:18 -0500
X-MC-Unique: cQluT85NN6yh2SIGcS7UEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDB7E18A08BE;
 Fri,  5 Feb 2021 09:05:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-108.ams2.redhat.com
 [10.36.113.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BCD260C9B;
 Fri,  5 Feb 2021 09:05:16 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 957BD18000B6; Fri,  5 Feb 2021 10:05:14 +0100 (CET)
Date: Fri, 5 Feb 2021 10:05:14 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/6] drm: Move vmap out of commit tail for SHMEM-based
 drivers
Message-ID: <20210205090514.ln6eeoqfcijrd5q2@sirius.home.kraxel.org>
References: <20210204200308.24216-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210204200308.24216-1-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: airlied@linux.ie, sam@ravnborg.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, virtualization@lists.linux-foundation.org,
 hdegoede@redhat.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, sean@poorly.run
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

  Hi,

> I smoke-tested the code by running fbdev, Xorg and weston with the
> converted mgag200 driver.

Looks sane to me.
Survived cirrus smoke test too.

Tested-by: Gerd Hoffmann <kraxel@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
