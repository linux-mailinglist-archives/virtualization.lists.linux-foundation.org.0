Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA632669F
	for <lists.virtualization@lfdr.de>; Wed, 22 May 2019 17:06:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0433CDCA;
	Wed, 22 May 2019 15:06:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9F666DB3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 15:06:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 01C2A6C5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 22 May 2019 15:06:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by asavdk4.altibox.net (Postfix) with ESMTPS id D5AB2803D6;
	Wed, 22 May 2019 17:06:35 +0200 (CEST)
Date: Wed, 22 May 2019 17:06:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/cirrus: remove leftover files
Message-ID: <20190522150634.GA26677@ravnborg.org>
References: <20190522103307.12711-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522103307.12711-1-kraxel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
	a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8
	a=7gkXJVJtAAAA:8 a=Uddh69Z27F23pCbIwTIA:9 a=CjuIK1q_8ugA:10
	a=E9Po1WZjFZOl8hwRPBS3:22
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
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

On Wed, May 22, 2019 at 12:33:07PM +0200, Gerd Hoffmann wrote:
> cirrus_drv.h and cirrus_ttm.c are unused since commit ab3e023b1b4c
> ("drm/cirrus: rewrite and modernize driver"), apparently I ran "rm"
> instead of "git rm" on them so they are still in present the tree.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Always nice with the code removal patches.
Will you apply yourself?

	Sam
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
