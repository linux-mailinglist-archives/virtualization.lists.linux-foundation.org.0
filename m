Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC6F479C4
	for <lists.virtualization@lfdr.de>; Mon, 17 Jun 2019 07:45:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 96964C4E;
	Mon, 17 Jun 2019 05:45:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 98594C4E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 05:45:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 578D12C3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 05:45:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9D02C83F45;
	Mon, 17 Jun 2019 05:45:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
	[10.36.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 031907BE7A;
	Mon, 17 Jun 2019 05:45:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id EB88B11AAF; Mon, 17 Jun 2019 07:45:00 +0200 (CEST)
Date: Mon, 17 Jun 2019 07:45:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Subject: Re: [EXTERNAL] Re: [PATCH 1/1] drm/bochs: Fix connector leak during
	driver unload
Message-ID: <20190617054500.73am3e5yv5uzpga7@sirius.home.kraxel.org>
References: <93b363ad62f4938d9ddf3e05b2a61e3f66b2dcd3.1558416473.git.sbobroff@linux.ibm.com>
	<20190521081029.dexgf7e7d3b7wxdw@sirius.home.kraxel.org>
	<20190617012033.GA1151@tungsten.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617012033.GA1151@tungsten.ozlabs.ibm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 17 Jun 2019 05:45:05 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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

On Mon, Jun 17, 2019 at 11:20:34AM +1000, Sam Bobroff wrote:
> On Tue, May 21, 2019 at 10:10:29AM +0200, Gerd Hoffmann wrote:
> >   Hi,
> > 
> > The bug is in the driver, so ...
> > 
> > > Bisecting the issue for commits to drivers/gpu/drm/bochs/ points to:
> > > 6579c39594ae ("drm/bochs: atomic: switch planes to atomic, wire up helpers.")
> > > ... but the issue also seems to be due to a change in the generic drm code
> > 
> > ... this one is the culprit and should be listed.
> > 
> > > (reverting it separately fixes the issue):
> > > 846c7dfc1193 ("drm/atomic: Try to preserve the crtc enabled state in drm_atomic_remove_fb, v2.")
> > > ... so I've included both in the commit.  Is that the right thing to do?
> > 
> > That only triggers the driver bug.
> > 
> > I'll fix it up on commit,
> >   Gerd
> 
> Sorry if I misunderstood, but were you going to take the patch and fix
> it up or would you like me to post a v2?

Patch is in drm-misc-next, I fixed it on commit.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
