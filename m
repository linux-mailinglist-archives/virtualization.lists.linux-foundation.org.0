Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E63F1066C1
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 08:00:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B2A2987FCE;
	Fri, 22 Nov 2019 07:00:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Header field occurs more than once: "To"
	occurs 3 times
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KKGh8Q+Y8cy8; Fri, 22 Nov 2019 07:00:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 80E1187FC3;
	Fri, 22 Nov 2019 07:00:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62EF4C18DA;
	Fri, 22 Nov 2019 07:00:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DFA3C18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 07:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 48122872C2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 07:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Header field occurs more than once: "To"
 occurs 3 times
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpEbxV-x7_5U
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 07:00:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C751E872BB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 07:00:09 +0000 (UTC)
Received: from localhost (unknown [40.117.208.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5CE442068E;
 Fri, 22 Nov 2019 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574406009;
 bh=EuOxNwnjR8S9udnkUYPy77WKDmn0D6tu53wyeiCznMU=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Cc:Subject:In-Reply-To:References:
 From;
 b=baUk4+ITzj2qPTb0uyvuMe3MTLZFYm+rUObSfrECTOkS2qdhGD22VmUK/ctHNILxO
 f+MqPDgBb3KZjEzfHeIENvm0inN4evqnH08FLc4nRJGWTltNZC2sV9+mjSkrsfC+8s
 ndaIDILDe5Lk7GfQBBIli1s5xYNON3PDvMYh/RxI=
Date: Fri, 22 Nov 2019 07:00:08 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] virtio_console: allocate inbufs in add_port() only if
 it is needed
In-Reply-To: <20191114122548.24364-1-lvivier@redhat.com>
References: <20191114122548.24364-1-lvivier@redhat.com>
Message-Id: <20191122070009.5CE442068E@mail.kernel.org>
Cc: , mst@redhat.com, stable@vger.kernel.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: a7a69ec0d8e4 ("virtio_console: free buffers after reset").

The bot has tested the following trees: v5.3.11, v4.19.84, v4.14.154, v4.9.201, v4.4.201.

v5.3.11: Build OK!
v4.19.84: Build OK!
v4.14.154: Build OK!
v4.9.201: Failed to apply! Possible dependencies:
    5c60300d68da ("virtio_console: reset on out of memory")

v4.4.201: Failed to apply! Possible dependencies:
    5c60300d68da ("virtio_console: reset on out of memory")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
