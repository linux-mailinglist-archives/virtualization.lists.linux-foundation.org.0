Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F35039FC5C
	for <lists.virtualization@lfdr.de>; Tue,  8 Jun 2021 18:24:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBE5A607D0;
	Tue,  8 Jun 2021 16:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHRVhMXDT0tF; Tue,  8 Jun 2021 16:24:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id A677F608B4;
	Tue,  8 Jun 2021 16:24:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3777CC0001;
	Tue,  8 Jun 2021 16:24:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A5B3C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 16:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D57F6830A7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 16:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Y-4WnFmnGZ1
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 16:24:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B3BA8309A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 16:24:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7779461185;
 Tue,  8 Jun 2021 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623169445;
 bh=8v1KyFbM4GJgpLqjlDyuFxRHG8XVuZG7F7r7v4rZAp8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rWRgDhM3QbuH2tw+aHp7Lq1R8XiozENdQjZSjDgN+dyx1q8FcA+huh6BvmibeP+sh
 4t/K0yaGg6WXD1018WfK+kOge49OCJQKJ94Yj2NI4ZNgy1YzHxaovMJukBfE9kR0IT
 cr0OnWR7b+Ca4HK5wgugnmUjOa9NpOhaXirfsvXbyM6YXWiSh/i/orJg9ZdhrnQmwL
 VbCszQ9tqV3Vtp4v5FJbCpTBbpNWfNmbydX1/+82Zbmc9cN8CtUoCEcPytmaX8kNY3
 0jaFJFMxlKknoN+7AQr9M64IlzDyig7zQnXKhnFxZtjKjpZ7VHxt4X1RQ4OyaJxjMO
 CCg8VP9nopBKg==
Subject: Re: [PATCH 0/7] Do not read from descriptor ring
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20210604055350.58753-1-jasowang@redhat.com>
From: Andy Lutomirski <luto@kernel.org>
Message-ID: <1c079daa-f73d-cb1a-15ef-d8f57f9813b8@kernel.org>
Date: Tue, 8 Jun 2021 09:24:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604055350.58753-1-jasowang@redhat.com>
Content-Language: en-US
Cc: ashish.kalra@amd.com, ak@linux.intel.com, file@sect.tu-berlin.de,
 kvm@vger.kernel.org, konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, hch@infradead.org,
 xieyongji@bytedance.com, stefanha@redhat.com
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

On 6/3/21 10:53 PM, Jason Wang wrote:
> Hi:
> 
> The virtio driver should not trust the device. This beame more urgent
> for the case of encrtpyed VM or VDUSE[1]. In both cases, technology
> like swiotlb/IOMMU is used to prevent the poking/mangling of memory
> from the device. But this is not sufficient since current virtio
> driver may trust what is stored in the descriptor table (coherent
> mapping) for performing the DMA operations like unmap and bounce so
> the device may choose to utilize the behaviour of swiotlb to perform
> attacks[2].

Based on a quick skim, this looks entirely reasonable to me.

(I'm not a virtio maintainer or expert.  I got my hands very dirty with
virtio once dealing with the DMA mess, but that's about it.)

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
