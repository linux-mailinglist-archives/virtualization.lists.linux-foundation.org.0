Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0348834704C
	for <lists.virtualization@lfdr.de>; Wed, 24 Mar 2021 05:00:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C9A5606F5;
	Wed, 24 Mar 2021 04:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0kSBMAVNdjlX; Wed, 24 Mar 2021 04:00:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 120EF60A5A;
	Wed, 24 Mar 2021 04:00:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95119C0012;
	Wed, 24 Mar 2021 04:00:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80B46C000A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Mar 2021 04:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F72B402B5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Mar 2021 04:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPkYWHVLM7dN
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Mar 2021 04:00:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B2ED40103
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Mar 2021 04:00:42 +0000 (UTC)
IronPort-SDR: HJmrCYTbazMe1T83jfV0drlrGNkQxhnNciLr21gS8bi+TuKPdBb19ZAwGwLICOWi7o85tBkoTR
 cwdhV4tpJWDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="251978922"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="251978922"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 21:00:41 -0700
IronPort-SDR: 2PFRo5AZLe+Q+e8VW5HKphckol1bSAXhX/pCaaXJKdVwlXhSsFVgscRrsav8C5Ln97JDY0R+3J
 HloNnkom3wUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="442027086"
Received: from unknown (HELO [10.239.154.55]) ([10.239.154.55])
 by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2021 21:00:34 -0700
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <20210323090108.ygx76exdgzudeeqi@vireshk-i7>
 <20210323093839.n7cq7f5poebqdwit@vireshk-i7>
 <5a415dbe-8e3b-2731-cc52-19aeadda1a17@intel.com>
 <20210324035225.skkllxexjl65gs6x@vireshk-i7>
From: Jie Deng <jie.deng@intel.com>
Message-ID: <70a2d0f7-ac48-b477-8368-7ef55696bff1@intel.com>
Date: Wed, 24 Mar 2021 12:00:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210324035225.skkllxexjl65gs6x@vireshk-i7>
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


On 2021/3/24 11:52, Viresh Kumar wrote:
> On 24-03-21, 08:53, Jie Deng wrote:
>> On 2021/3/23 17:38, Viresh Kumar wrote:
>>> On 23-03-21, 14:31, Viresh Kumar wrote:
>>>> On 23-03-21, 22:19, Jie Deng wrote:
>>>>> +static int virtio_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
>>>>> +{
>>>>> +	struct virtio_i2c *vi = i2c_get_adapdata(adap);
>>>>> +	struct virtqueue *vq = vi->vq;
>>>>> +	struct virtio_i2c_req *reqs;
>>>>> +	unsigned long time_left;
>>>>> +	int ret, nr;
>>>>> +
>>>>> +	reqs = kcalloc(num, sizeof(*reqs), GFP_KERNEL);
>>>>> +	if (!reqs)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	mutex_lock(&vi->lock);
>>>>> +
>>>>> +	ret = virtio_i2c_send_reqs(vq, reqs, msgs, num);
>>>>> +	if (ret == 0)
>>>>> +		goto err_unlock_free;
>>>>> +
>>>>> +	nr = ret;
>>>>> +	reinit_completion(&vi->completion);
>>>> I think I may have found a possible bug here. This reinit_completion() must
>>>> happen before we call virtio_i2c_send_reqs(). It is certainly possible (surely
>>>> in corner cases) that virtio_i2c_msg_done() may get called right after
>>>> virtio_i2c_send_reqs() and before we were able to call reinit_completion(). And
>>>> in that case we will never see the completion happen at all.
>>>>
>>>>> +	virtqueue_kick(vq);
>>> I may have misread this. Can the actually start before virtqueue_kick() is
>>> called ?
> I didn't write it properly here. I wanted to say,
>
> "Can the _transfer_ actually start before virtqueue_kick() is called ?"
>   


It can't start until the virtqueue_kick() is called. Call virtqueue_kick 
then wait.


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
