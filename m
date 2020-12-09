Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9332D3BCB
	for <lists.virtualization@lfdr.de>; Wed,  9 Dec 2020 08:00:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7F0ED8776C;
	Wed,  9 Dec 2020 07:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Me5IR0DgWvs4; Wed,  9 Dec 2020 07:00:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE9CD8777E;
	Wed,  9 Dec 2020 07:00:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E6D7C013B;
	Wed,  9 Dec 2020 07:00:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA400C013B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 07:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B8192203A8
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 07:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 77RXq546dGKi
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 07:00:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id D50C320385
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 07:00:24 +0000 (UTC)
Date: Wed, 9 Dec 2020 08:01:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607497224;
 bh=TqyzhuxMMqbKXc3bepx11P/TzDDSmev6GrXUVCluLxQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=gjcbisy06WGfvf/qczrQnN14hDiFS3Z066o/5tWUNGGXzpO+yd97noHYrenov7xz3
 gcgJCPQ4TfTeOnzi317CqFEr2ViZUajsVyfgPq5zWM7THvXPUfpWVG2J3YLZmL/HD8
 fhJqUy2Weg7//f47i1DBFFbeUzy2yerHlrmBErLY=
From: Greg KH <gregkh@linuxfoundation.org>
To: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Subject: Re: [PATCH RESEND v2] virtio-input: add multi-touch support
Message-ID: <X9B2VRdXgwjxU15J@kroah.com>
References: <20201208210150.20001-1-vasyl.vavrychuk@opensynergy.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208210150.20001-1-vasyl.vavrychuk@opensynergy.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Mathias Crombez <mathias.crombez@faurecia.com>, linux-input@vger.kernel.org
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

On Tue, Dec 08, 2020 at 11:01:50PM +0200, Vasyl Vavrychuk wrote:
> From: Mathias Crombez <mathias.crombez@faurecia.com>
> 
> Without multi-touch slots allocated, ABS_MT_SLOT events will be lost by
> input_handle_abs_event.
> 
> Signed-off-by: Mathias Crombez <mathias.crombez@faurecia.com>
> Signed-off-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
> Tested-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
> ---
> v2: fix patch corrupted by corporate email server
> 
>  drivers/virtio/Kconfig        | 11 +++++++++++
>  drivers/virtio/virtio_input.c |  8 ++++++++
>  2 files changed, 19 insertions(+)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
