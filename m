Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E6516E9EC
	for <lists.virtualization@lfdr.de>; Tue, 25 Feb 2020 16:22:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8220485FC0;
	Tue, 25 Feb 2020 15:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4goIeSKlXlda; Tue, 25 Feb 2020 15:22:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4BDFB86762;
	Tue, 25 Feb 2020 15:22:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B258C0177;
	Tue, 25 Feb 2020 15:22:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D11FDC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 15:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BA5E986408
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 15:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WoePxE3bByGn
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 15:22:20 +0000 (UTC)
X-Greylist: delayed 00:17:40 by SQLgrey-1.7.6
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8A02785E3A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Feb 2020 15:22:19 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20346492-1500050 for multiple; Tue, 25 Feb 2020 15:04:28 +0000
MIME-Version: 1.0
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Sean Paul <sean@poorly.run>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200225140347.GA22864@embeddedor>
References: <20200225140347.GA22864@embeddedor>
Message-ID: <158264306645.3062.14566490586309398145@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH][next] drm: Replace zero-length array with flexible-array
 member
Date: Tue, 25 Feb 2020 15:04:26 +0000
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org
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

Quoting Gustavo A. R. Silva (2020-02-25 14:03:47)
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:

I remember when gcc didn't support []. For the record, it appears
support for flexible arrays landed in gcc-3.0. So passes the minimum
compiler spec. That would be useful to mention for old farts with
forgetful memories.
-Chris
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
