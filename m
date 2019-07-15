Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F43769919
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 18:32:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 65034D3E;
	Mon, 15 Jul 2019 16:32:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2A5D3B88
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 16:32:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 03B3971C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 16:32:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by asavdk4.altibox.net (Postfix) with ESMTPS id 42FD480314;
	Mon, 15 Jul 2019 18:32:16 +0200 (CEST)
Date: Mon, 15 Jul 2019 18:32:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v1 31/33] drm/bochs: drop use of drmP.h
Message-ID: <20190715163215.GK27038@ravnborg.org>
References: <20190630061922.7254-1-sam@ravnborg.org>
	<20190630061922.7254-32-sam@ravnborg.org>
	<20190701063908.5mufonj45bgitzyt@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701063908.5mufonj45bgitzyt@sirius.home.kraxel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
	a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
	a=20KFwNOVAAAA:8 a=Z4Rwk6OoAAAA:8 a=LZjyS6xDFEDGbRYreboA:9
	a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
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

On Mon, Jul 01, 2019 at 08:39:08AM +0200, Gerd Hoffmann wrote:
> On Sun, Jun 30, 2019 at 08:19:20AM +0200, Sam Ravnborg wrote:
> > Drop use of the deprecated drmP.h header file.
> > Made bochs.h self-contained and then fixed
> > fallout in remaining files.
> > Several unused includes was dropped in the process.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: virtualization@lists.linux-foundation.org
> 
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks again, applied.

	Sam
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
