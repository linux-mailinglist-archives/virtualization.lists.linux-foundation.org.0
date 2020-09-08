Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E91260F3F
	for <lists.virtualization@lfdr.de>; Tue,  8 Sep 2020 12:04:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 11EF8273E3;
	Tue,  8 Sep 2020 10:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 33YTYH7dmr0b; Tue,  8 Sep 2020 10:04:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B5B9A273B5;
	Tue,  8 Sep 2020 10:04:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90D6BC0051;
	Tue,  8 Sep 2020 10:04:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25BD3C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 10:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1475B87271
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 10:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7XldV3gpW0s
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 10:04:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6F8CB871E0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599559447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=huJspaVKs2soWVBG7ypNpD3pCie9PJMElLgmWSCDlpg=;
 b=fSTZxvFGlALxnKrauUCM/MNlb1zAjkFHpBnopMQgw0UsJ98IzB+Qpz7NnGUhM9NPeh4TDr
 wj0MGGGYZRT3RDuLdBCXkbJrzBwtVN2WQ4OXGDXTg92ajsDHyuhlF165YBnXGLpbIC/Qr+
 3NTpbp8wHJx3bTxL3eIWXmSqnJ1ZJl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-1GwrGC8JO-KOM_F9MMjh6g-1; Tue, 08 Sep 2020 06:04:03 -0400
X-MC-Unique: 1GwrGC8JO-KOM_F9MMjh6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B5A8801AE0;
 Tue,  8 Sep 2020 10:04:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32E505C1BB;
 Tue,  8 Sep 2020 10:04:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 41EEF1FCF5; Tue,  8 Sep 2020 12:04:01 +0200 (CEST)
Date: Tue, 8 Sep 2020 12:04:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/virtio: drop quirks handling
Message-ID: <20200908100401.q7quz5m7m42wvobj@sirius.home.kraxel.org>
References: <20200908064741.1010-1-kraxel@redhat.com>
 <20200908085721.GJ2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908085721.GJ2352366@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On Tue, Sep 08, 2020 at 10:57:21AM +0200, Daniel Vetter wrote:
> On Tue, Sep 08, 2020 at 08:47:41AM +0200, Gerd Hoffmann wrote:
> > These days dma ops can be overridden per device, and the virtio core
> 
> "can be overridden" or "are"?

Didn't happen yet, so scratch this one for now ...

take care,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
