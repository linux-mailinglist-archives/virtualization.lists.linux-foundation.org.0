Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD9C3459BF
	for <lists.virtualization@lfdr.de>; Tue, 23 Mar 2021 09:33:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 131D04049B;
	Tue, 23 Mar 2021 08:33:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5316sRcsvCH; Tue, 23 Mar 2021 08:33:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB8DA404A1;
	Tue, 23 Mar 2021 08:33:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 428D4C0001;
	Tue, 23 Mar 2021 08:33:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CADD1C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 08:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9DFF40497
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 08:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYfAmR0n78YA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 08:33:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A48A40496
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 08:33:37 +0000 (UTC)
IronPort-SDR: SMj2Mrk4hT2HVXOs1TN1Io8hMMi35G6M3vHccwloPWjBsjb/SEzl6PtAr2ZmZpaJSSS3n9LJnK
 vDyzSbiYBN9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="190528873"
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="190528873"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 01:33:36 -0700
IronPort-SDR: dxMPLZLIdwbEcufioZOCgJqKgJrpYMB+pfcuO4K7maUx4JRNqMDGTLG2wGyMaN82r7P8FYJWo6
 V6galnLHWa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,271,1610438400"; d="scan'208";a="435470763"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
 by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2021 01:33:31 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <a2994a8f-bbf9-b26f-a9d2-eb02df6623b8@intel.com>
Date: Tue, 23 Mar 2021 16:33:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210323072704.rgoelmq62fl2wjjf@vireshk-i7>
Content-Language: en-US
Cc: mst@redhat.com, bjorn.andersson@linaro.org,
 wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, wsa@kernel.org,
 andriy.shevchenko@linux.intel.com, yu1.wang@intel.com,
 u.kleine-koenig@pengutronix.de, kblaiech@mellanox.com,
 virtualization@lists.linux-foundation.org, arnd@arndb.de, stefanha@redhat.com,
 tali.perry1@gmail.com, conghui.chen@intel.com, loic.poulain@linaro.org,
 linux-kernel@vger.kernel.org, Sergey.Semin@baikalelectronics.ru,
 jarkko.nikula@linux.intel.com, shuo.a.liu@intel.com, pbonzini@redhat.com,
 rppt@kernel.org
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

On 2021/3/23 15:27, Viresh Kumar wrote:

> On 23-03-21, 22:19, Jie Deng wrote:
>> +static int __maybe_unused virtio_i2c_freeze(struct virtio_device *vdev)
>> +{
>> +	virtio_i2c_del_vqs(vdev);
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused virtio_i2c_restore(struct virtio_device *vdev)
>> +{
>> +	return virtio_i2c_setup_vqs(vdev->priv);
>> +}
> Sorry for not looking at this earlier, but shouldn't we enclose the above two
> within #ifdef CONFIG_PM_SLEEP instead and drop the __maybe_unused ?


I remembered I was suggested to use "__maybe_unused" instead of "#ifdef".

You may check this https://lore.kernel.org/patchwork/patch/732981/

The reason may be something like that.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
