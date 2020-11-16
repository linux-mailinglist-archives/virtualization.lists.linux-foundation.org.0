Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B192B3E2A
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 08:56:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 843FB2043D;
	Mon, 16 Nov 2020 07:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r-xx-+rKh2l9; Mon, 16 Nov 2020 07:56:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 678772042D;
	Mon, 16 Nov 2020 07:56:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39C90C07FF;
	Mon, 16 Nov 2020 07:56:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28D01C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 07:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 22E7686830
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 07:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANeaSY9yGshr
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 07:56:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 57DAB863CC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 07:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605513413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/vIAOmfvFNMPmf8CjkNMglbCHByAHwkTLNsLVL8lU0U=;
 b=QCTLVUZ+IOF+rH+1t9Z7s9rRiEg3/5p0PlpCX/7ynzA9voAPVSHpHWwYtoyzXD3GZHE/IJ
 i8QdVHLKSxNOU1uyEjJ1MSSW271/nPGaoPDEHouHhhXAve2cv+Yn0Ysd82CFaBgStZ1ieU
 LBDycZyRblYYVJxjAlw4/lAFSkB5C9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-ilGDvEEHN3WJ_8GVhbQS1Q-1; Mon, 16 Nov 2020 02:56:48 -0500
X-MC-Unique: ilGDvEEHN3WJ_8GVhbQS1Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A7945F9C0;
 Mon, 16 Nov 2020 07:56:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-65.ams2.redhat.com
 [10.36.112.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1D035B4CC;
 Mon, 16 Nov 2020 07:56:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C017916E31; Mon, 16 Nov 2020 08:56:44 +0100 (CET)
Date: Mon, 16 Nov 2020 08:56:44 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Zou Wei <zou_wei@huawei.com>
Subject: Re: [PATCH -next] drm/virtio: Make virtgpu_dmabuf_ops with static
 keyword
Message-ID: <20201116075644.2kubdpmlowbevo3p@sirius.home.kraxel.org>
References: <1605338173-22100-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1605338173-22100-1-git-send-email-zou_wei@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 virtualization@lists.linux-foundation.org
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

On Sat, Nov 14, 2020 at 03:16:13PM +0800, Zou Wei wrote:
> Fix the following sparse warning:
> 
> ./virtgpu_prime.c:46:33: warning: symbol 'virtgpu_dmabuf_ops' was not declared. Should it be static?

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
