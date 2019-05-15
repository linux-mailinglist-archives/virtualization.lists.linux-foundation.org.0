Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1351F676
	for <lists.virtualization@lfdr.de>; Wed, 15 May 2019 16:22:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 03B61C6E;
	Wed, 15 May 2019 14:22:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1DCC2B88
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 14:22:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CF7D88D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 14:22:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2408F3086224;
	Wed, 15 May 2019 14:22:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BA6A60F81;
	Wed, 15 May 2019 14:22:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 2F45DA1E1; Wed, 15 May 2019 16:22:35 +0200 (CEST)
Date: Wed, 15 May 2019 16:22:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 00/20] Share TTM code among DRM framebuffer drivers
Message-ID: <20190515142235.qfwnvsrhnogj67hz@sirius.home.kraxel.org>
References: <20190508082630.15116-1-tzimmermann@suse.de>
	<05884df3-207a-6c2f-226e-d01266f17b77@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05884df3-207a-6c2f-226e-d01266f17b77@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 15 May 2019 14:22:42 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: noralf@tronnes.org, airlied@linux.ie, puck.chen@hisilicon.com,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
	kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
	daniel@ffwll.ch, zourongrong@gmail.com, sam@ravnborg.org,
	christian.koenig@amd.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed, May 15, 2019 at 09:05:54AM +0200, Thomas Zimmermann wrote:
> Hi,
> 
> most of this patch set still needs reviews.
> 
> If it's too large for merging or reviewing at once, I could move the
> driver changes into separate patch sets. The vbox driver's changes have
> been accepted by Hans already. So only keeping the core changes plus
> vbox would be an option.

Looks all good to me.  bochs survived my testing, vbox is reviewed and
IIRC you've tested two of the other three drivers.  So all but one
driver is covered.

I'll go push this to drm-misc-next in a moment.

> > Future directions: with these changes, the respective drivers can also
> > share some of their mode-setting or fbdev code. GEM VRAM's PRIME helpers
> > allow for using the generic fbcon emulation.

Using generic fbcon should be easy now.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
