Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD992AEEA
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 08:48:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F22E414B0;
	Mon, 27 May 2019 06:48:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 631E2149E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 06:47:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1F0D8A9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 06:47:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7983C3086215;
	Mon, 27 May 2019 06:47:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F67660BEC;
	Mon, 27 May 2019 06:47:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 604DB16E08; Mon, 27 May 2019 08:47:43 +0200 (CEST)
Date: Mon, 27 May 2019 08:47:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tyler Slabinski <tslabinski@slabity.net>
Subject: Re: PROBLEM: VirtIO DRM driver crashes when setting specific 16.16
	fixed-point property values
Message-ID: <20190527064743.kooeycqfj7t22iwt@sirius.home.kraxel.org>
References: <CAOoxD-tWknshQLXFzyv2t1CVhfK0SCNec=6MVij9q6kQAVzY=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOoxD-tWknshQLXFzyv2t1CVhfK0SCNec=6MVij9q6kQAVzY=g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 27 May 2019 06:47:49 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
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

On Fri, May 24, 2019 at 02:46:50PM -0400, Tyler Slabinski wrote:
> VirtIO DRM driver crashes when setting specific 16.16 fixed-point
> property values
> 
> When running a virtual machine with a VirtIO GPU, it's possible to
> crash the entire VM by setting the value of a 16.16 fixed-point
> property to any value below 65536 (1.0 in 16.16 format or 0x00010000).
> As a specific example, setting the SRC_W property on a plane DRM
> object to a value of 30000 will cause the VM to hard-shutdown.

Do you have a qemu stacktrace?

thanks,
  Gerd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
