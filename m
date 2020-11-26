Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 216A72C4CFC
	for <lists.virtualization@lfdr.de>; Thu, 26 Nov 2020 03:00:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9AA0787601;
	Thu, 26 Nov 2020 02:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YmgZtqh2V0CT; Thu, 26 Nov 2020 02:00:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A964A875EA;
	Thu, 26 Nov 2020 02:00:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 766A6C0052;
	Thu, 26 Nov 2020 02:00:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08DD8C0052
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 02:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DEBA587115
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 02:00:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVZYkl-V3KZA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 02:00:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 08BC586FB6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Nov 2020 02:00:24 +0000 (UTC)
IronPort-SDR: scgsU7OdgK3qSh+g2C/mwyDuAAwHdykeZ1fhkiPJU7UhBFhrpny+kMdpurpxGIs5diFurzYwdW
 Mu55M1ae5gHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="233831086"
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="233831086"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 18:00:23 -0800
IronPort-SDR: 913kfw8Ec+NcvFxFD6m4Gu+rguSGuI/s3mXDR8Y+FHviKD1VfSUOTp2Swp1GI+aSrMDp9DlIXS
 tviKmatTO/xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,370,1599548400"; d="scan'208";a="359379959"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.51])
 ([10.239.154.51])
 by orsmga008.jf.intel.com with ESMTP; 25 Nov 2020 18:00:18 -0800
Subject: Re: [PATCH v4] i2c: virtio: add a virtio i2c frontend driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <7c5e44c534b3fd07b855af22d8d4b78bc44cd7a4.1602465440.git.jie.deng@intel.com>
 <20201125043422-mutt-send-email-mst@kernel.org>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <6cbea83e-04fa-8d5a-bba7-d80afabe8a5d@intel.com>
Date: Thu, 26 Nov 2020 10:00:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201125043422-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Cc: Sergey.Semin@baikalelectronics.ru, bjorn.andersson@linaro.org,
 loic.poulain@linaro.org, tali.perry1@gmail.com, yu1.wang@intel.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org,
 virtualization@lists.linux-foundation.org, wsa@kernel.org,
 wsa+renesas@sang-engineering.com, jarkko.nikula@linux.intel.com,
 linux-i2c@vger.kernel.org, rppt@kernel.org, shuo.a.liu@intel.com,
 andriy.shevchenko@linux.intel.com, conghui.chen@intel.com, jdelvare@suse.de
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

On 2020/11/25 17:35, Michael S. Tsirkin wrote:

> On Mon, Oct 12, 2020 at 09:55:55AM +0800, Jie Deng wrote:
>> Add an I2C bus driver for virtio para-virtualization.
>>
>> The controller can be emulated by the backend driver in
>> any device model software by following the virtio protocol.
>>
>> This driver communicates with the backend driver through a
>> virtio I2C message structure which includes following parts:
>>
>> - Header: i2c_msg addr, flags, len.
>> - Data buffer: the pointer to the I2C msg data.
>> - Status: the processing result from the backend.
>>
>> People may implement different backend drivers to emulate
>> different controllers according to their needs. A backend
>> example can be found in the device model of the open source
>> project ACRN. For more information, please refer to
>> https://projectacrn.org.
>>
>> The virtio device ID 34 is used for this I2C adpter since IDs
>> before 34 have been reserved by other virtio devices.
>>
>> Co-developed-by: Conghui Chen <conghui.chen@intel.com>
>> Signed-off-by: Conghui Chen <conghui.chen@intel.com>
>> Signed-off-by: Jie Deng <jie.deng@intel.com>
>> Reviewed-by: Shuo Liu <shuo.a.liu@intel.com>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> I assume this will be updated once the specification is acked
> by the virtio tc. Holding off on this one for now since
> we know there will be host/guest ABI changes.

Yeah. I will update this driver once the specification is acked by the 
virtio tc.

Thanks.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
