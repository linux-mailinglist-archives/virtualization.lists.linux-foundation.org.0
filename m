Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4384D32CA34
	for <lists.virtualization@lfdr.de>; Thu,  4 Mar 2021 02:53:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85C3960701;
	Thu,  4 Mar 2021 01:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0BDiz2HX-0w; Thu,  4 Mar 2021 01:53:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DAA66F499;
	Thu,  4 Mar 2021 01:53:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C76CEC000F;
	Thu,  4 Mar 2021 01:53:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E338C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 01:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 505B240197
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 01:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 73eXa3JhUQ4G
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 01:52:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DC044017D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 01:52:57 +0000 (UTC)
IronPort-SDR: 5PzhQT4dDn5r7oAaEDPxX8HMtYlE896d7INRXpAAAci+Fput0WuXVuO6HN1IFT3C7OUYzewQJ5
 0Z7Sm0/XV9dQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="207017911"
X-IronPort-AV: E=Sophos;i="5.81,221,1610438400"; d="scan'208";a="207017911"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 17:52:56 -0800
IronPort-SDR: 9hg6fpsmucV/VDtjkzokIe8zB32Lhd6w4Hu1WfPRuU4C58Cgb7Z/bWUgeg5amMwkAM6oBHVdk+
 GVDCwulaHrMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,221,1610438400"; d="scan'208";a="436167928"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
 by fmsmga002.fm.intel.com with ESMTP; 03 Mar 2021 17:48:14 -0800
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210303075430.n7ewkots6cgbbabi@vireshk-i7>
 <876371c3-ba9a-5176-493b-5a883cba3b07@intel.com>
 <20210303093836.ftgq62yw7i6cd3q6@vireshk-i7>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <263160ce-50f0-a7a0-de18-ca10fee48bec@intel.com>
Date: Thu, 4 Mar 2021 09:47:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303093836.ftgq62yw7i6cd3q6@vireshk-i7>
Content-Language: en-US
Cc: mst@redhat.com, bjorn.andersson@linaro.org,
 wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com,
 Vincent Guittot <vincent.guittot@linaro.org>, yu1.wang@intel.com,
 u.kleine-koenig@pengutronix.de, kblaiech@mellanox.com,
 virtualization@lists.linux-foundation.org, arnd@arndb.de,
 Stefan Hajnoczi <stefanha@redhat.com>, tali.perry1@gmail.com,
 conghui.chen@intel.com, loic.poulain@linaro.org, linux-kernel@vger.kernel.org,
 Sergey.Semin@baikalelectronics.ru, jarkko.nikula@linux.intel.com,
 shuo.a.liu@intel.com, rppt@kernel.org
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


On 2021/3/3 17:38, Viresh Kumar wrote:
> On 03-03-21, 16:46, Jie Deng wrote:
>> This is not a problem. My original proposal was to mirror the struct
>> i2c_msg.
>> The code you looked at was based on that.
>> However, the virtio TC prefer not to mirror it. They have some concerns.
>> For example, there is a bit I2C_M_RD in i2c_msg.flag which has the same
>> meaning with
>> the R/W in virtio descriptor. This is a repetition which may cause problems.
>> So the virtio_i2c_out_hdr.flags is used to instead of i2c_msg.flags for
>> extension.
> So by default we don't support any of the existing flags except
> I2C_M_RD?
Yes. That's the current status.
> #define I2C_M_TEN		0x0010	/* this is a ten bit chip address */
> #define I2C_M_RD		0x0001	/* read data, from slave to master */
> #define I2C_M_STOP		0x8000	/* if I2C_FUNC_PROTOCOL_MANGLING */
> #define I2C_M_NOSTART		0x4000	/* if I2C_FUNC_NOSTART */
> #define I2C_M_REV_DIR_ADDR	0x2000	/* if I2C_FUNC_PROTOCOL_MANGLING */
> #define I2C_M_IGNORE_NAK	0x1000	/* if I2C_FUNC_PROTOCOL_MANGLING */
> #define I2C_M_NO_RD_ACK		0x0800	/* if I2C_FUNC_PROTOCOL_MANGLING */
> #define I2C_M_RECV_LEN		0x0400	/* length will be first received byte */
>
> How do we work with clients who want to use such flags now ?
My plan is to have a minimum driver get merged. Then we have a base and 
we can
update virtio_i2c_out_hdr.flags for the feature extensibility. Then, If 
you want to help to develop
this stuff, you can just follow the same flow. First, you can update the 
Spec by sending
comments to virtio-comment@lists.oasis-open.org. Once your Spec patch is 
acked by the
virtio TC, you can then send patches to update the corresponding drivers.

Thanks.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
