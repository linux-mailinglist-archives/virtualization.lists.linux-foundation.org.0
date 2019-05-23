Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4683527A1B
	for <lists.virtualization@lfdr.de>; Thu, 23 May 2019 12:14:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D4D7EAD0;
	Thu, 23 May 2019 10:13:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5FCAFA55
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 10:13:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8F11981A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 10:13:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A10687FDFF;
	Thu, 23 May 2019 10:13:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-101.ams2.redhat.com
	[10.36.116.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 204021001E6F;
	Thu, 23 May 2019 10:13:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 0008F16E08; Thu, 23 May 2019 12:13:36 +0200 (CEST)
Date: Thu, 23 May 2019 12:13:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/cirrus: remove leftover files
Message-ID: <20190523101336.thknzetzyx3j6sa7@sirius.home.kraxel.org>
References: <20190522103307.12711-1-kraxel@redhat.com>
	<20190522150634.GA26677@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522150634.GA26677@ravnborg.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 23 May 2019 10:13:40 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
	open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
	<virtualization@lists.linux-foundation.org>
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

On Wed, May 22, 2019 at 05:06:34PM +0200, Sam Ravnborg wrote:
> On Wed, May 22, 2019 at 12:33:07PM +0200, Gerd Hoffmann wrote:
> > cirrus_drv.h and cirrus_ttm.c are unused since commit ab3e023b1b4c
> > ("drm/cirrus: rewrite and modernize driver"), apparently I ran "rm"
> > instead of "git rm" on them so they are still in present the tree.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Always nice with the code removal patches.
> Will you apply yourself?

Yes.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
