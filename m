Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1612C4726
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 19:01:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C74B52E0F4;
	Wed, 25 Nov 2020 18:01:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwpnu+yN4Wma; Wed, 25 Nov 2020 18:01:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B657F2E0F1;
	Wed, 25 Nov 2020 18:01:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81905C0052;
	Wed, 25 Nov 2020 18:01:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7214C0052
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 18:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C451D876A4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 18:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4i7OaJ9bQnPg
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 18:01:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B8E18876AB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 18:01:04 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CAAA6206F9;
 Wed, 25 Nov 2020 18:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606327264;
 bh=VO6ybE3NuVe6PVRuDIjXJ0fne429g7bckEdtC+7dzRM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TyNnZNxWTrn8zjMyDucfA3WTp3zS1SWpriZSQ4kRhoMFHzamSoGd8WgPO2BHuQebR
 L8mp1SH0XOWwYVir5qnTdNDG8M10leWN1cdz+hwJxaGmJEydPnzLSvd0HQa3U7JTmC
 iDvZjXPGRpcVcfe8KIuGzeUuXn+otPZVWrGcAn4w=
Date: Wed, 25 Nov 2020 13:01:02 -0500
From: Sasha Levin <sashal@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.9 22/33] vhost scsi: add lun parser helper
Message-ID: <20201125180102.GL643756@sasha-vm>
References: <20201125153550.810101-1-sashal@kernel.org>
 <20201125153550.810101-22-sashal@kernel.org>
 <25cd0d64-bffc-9506-c148-11583fed897c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25cd0d64-bffc-9506-c148-11583fed897c@redhat.com>
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mike Christie <michael.christie@oracle.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, Nov 25, 2020 at 06:48:21PM +0100, Paolo Bonzini wrote:
>On 25/11/20 16:35, Sasha Levin wrote:
>>From: Mike Christie <michael.christie@oracle.com>
>>
>>[ Upstream commit 18f1becb6948cd411fd01968a0a54af63732e73c ]
>>
>>Move code to parse lun from req's lun_buf to helper, so tmf code
>>can use it in the next patch.
>>
>>Signed-off-by: Mike Christie <michael.christie@oracle.com>
>>Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>>Acked-by: Jason Wang <jasowang@redhat.com>
>>Link: https://lore.kernel.org/r/1604986403-4931-5-git-send-email-michael.christie@oracle.com
>>Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
>>Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This doesn't seem like stable material, does it?

It went in as a dependency for efd838fec17b ("vhost scsi: Add support
for LUN resets."), which is the next patch.

-- 
Thanks,
Sasha
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
