Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B5B39A9A4
	for <lists.virtualization@lfdr.de>; Thu,  3 Jun 2021 20:01:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9A7660B67;
	Thu,  3 Jun 2021 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dpPEa5KtH3C6; Thu,  3 Jun 2021 18:01:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860FB60B76;
	Thu,  3 Jun 2021 18:01:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 910ACC0027;
	Thu,  3 Jun 2021 18:01:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08A77C0001;
 Thu,  3 Jun 2021 18:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D376D40611;
 Thu,  3 Jun 2021 18:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 53V_6drYf6yN; Thu,  3 Jun 2021 18:01:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7B7C4060C;
 Thu,  3 Jun 2021 18:00:59 +0000 (UTC)
IronPort-SDR: 9u7lB+de0ppGOwkkSjC2LR9ZHxjWZ9YveL1LwmAMMDKUQSWhxJjFjUUW9O07Km4/gTA6tWJsw3
 W1e4IKMOibew==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="267969980"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="267969980"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 11:00:51 -0700
IronPort-SDR: zWl9IAVAqjS/nU7br8N4D0lZd7U38PTrXKOJDam1wiKAadNjauAH+/i6mcx4J0u5MOYtULc7BU
 orc5GUV+Jo2Q==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="550787338"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.209.7.237])
 ([10.209.7.237])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 11:00:48 -0700
Subject: Re: [PATCH v1 1/8] virtio: Force only split mode with protected guest
To: Andy Lutomirski <luto@kernel.org>, mst@redhat.com
References: <20210603004133.4079390-1-ak@linux.intel.com>
 <20210603004133.4079390-2-ak@linux.intel.com>
 <cc5c8265-83f7-aeb1-bc30-3367fe68bc97@kernel.org>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <a0e66b4c-cec5-2a26-9431-d5a21e22c8f2@linux.intel.com>
Date: Thu, 3 Jun 2021 11:00:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <cc5c8265-83f7-aeb1-bc30-3367fe68bc97@kernel.org>
Content-Language: en-US
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, jpoimboe@redhat.com, robin.murphy@arm.com,
 hch@lst.de, m.szyprowski@samsung.com
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


On 6/3/2021 10:33 AM, Andy Lutomirski wrote:
> On 6/2/21 5:41 PM, Andi Kleen wrote:
>> Only allow split mode when in a protected guest. Followon
>> patches harden the split mode code paths, and we don't want
>> an malicious host to force anything else. Also disallow
>> indirect mode for similar reasons.
> I read this as "the virtio driver is buggy.  Let's disable most of the
> buggy code in one special case in which we need a driver without bugs.
> In all the other cases (e.g. hardware virtio device connected over
> USB-C), driver bugs are still allowed."

My understanding is most of the other modes (except for split with separate descriptors) are obsolete and just there for compatibility. As long as they're deprecated they won't harm anyone.

-Andi

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
