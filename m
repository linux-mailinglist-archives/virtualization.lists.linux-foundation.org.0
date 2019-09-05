Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D5678A9B71
	for <lists.virtualization@lfdr.de>; Thu,  5 Sep 2019 09:14:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 320061580;
	Thu,  5 Sep 2019 07:14:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EB1BA1568
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 07:14:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B09FE89C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  5 Sep 2019 07:14:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D698A10567;
	Thu,  5 Sep 2019 07:14:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
	[10.36.117.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D87B60606;
	Thu,  5 Sep 2019 07:14:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 4BA8531E76; Thu,  5 Sep 2019 09:14:07 +0200 (CEST)
Date: Thu, 5 Sep 2019 09:14:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jaak Ristioja <jaak@ristioja.ee>
Subject: Re: Xorg indefinitely hangs in kernelspace
Message-ID: <20190905071407.47iywqcqomizs3yr@sirius.home.kraxel.org>
References: <92785039-0941-4626-610b-f4e3d9613069@ristioja.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92785039-0941-4626-610b-f4e3d9613069@ristioja.ee>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 05 Sep 2019 07:14:09 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	Daniel Vetter <daniel@ffwll.ch>, spice-devel@lists.freedesktop.org,
	Dave Airlie <airlied@redhat.com>
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

On Tue, Aug 06, 2019 at 09:00:10PM +0300, Jaak Ristioja wrote:
> Hello!
> 
> I'm writing to report a crash in the QXL / DRM code in the Linux kernel.
> I originally filed the issue on LaunchPad and more details can be found
> there, although I doubt whether these details are useful.

Any change with kernel 5.3-rc7 ?

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
