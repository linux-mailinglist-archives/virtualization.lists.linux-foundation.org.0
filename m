Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F39327DEE
	for <lists.virtualization@lfdr.de>; Mon,  1 Mar 2021 13:11:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8836042FDF;
	Mon,  1 Mar 2021 12:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RODqiU6K9xM; Mon,  1 Mar 2021 12:11:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7219142FAC;
	Mon,  1 Mar 2021 12:11:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 089EEC0001;
	Mon,  1 Mar 2021 12:11:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64EEAC0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 12:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E41D83C76
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 12:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FmEHtCkg2vgw
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 12:11:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D08CB83C3C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 12:11:47 +0000 (UTC)
IronPort-SDR: 7UIWdHtKs9HyAXQYtnLrNoIg8B/3IBr7WNlHeAmdfpo4gEbC9jdoIclgi6bjowEADrmZtmomf7
 ZkUosCHH5n4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9909"; a="185764488"
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="185764488"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 04:11:47 -0800
IronPort-SDR: gUA0LbTEcUEdSQsKIp5iXeKjN/nBXDZy5Pog61nPnurKuGwW8gYLa17540bXo984ytkjKEQim2
 /ez9RTGvHPaw==
X-IronPort-AV: E=Sophos;i="5.81,215,1610438400"; d="scan'208";a="435380350"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 04:09:35 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lGhMb-0098Ty-Ql; Mon, 01 Mar 2021 14:09:25 +0200
Date: Mon, 1 Mar 2021 14:09:25 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v5] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <YDzZdc9+6hEvIDS1@smile.fi.intel.com>
References: <00f826ffe1b6b4f5fb41de2b55ad6b8783b7ff45.1614579846.git.jie.deng@intel.com>
 <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301115441.a4s5xzwm6d6ohz7f@vireshk-i7>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Sergey.Semin@baikalelectronics.ru, bjorn.andersson@linaro.org,
 loic.poulain@linaro.org, arnd@arndb.de, mst@redhat.com, shuo.a.liu@intel.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 wsa@kernel.org, wsa+renesas@sang-engineering.com,
 jarkko.nikula@linux.intel.com, linux-i2c@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, kblaiech@mellanox.com, tali.perry1@gmail.com,
 conghui.chen@intel.com, rppt@kernel.org, yu1.wang@intel.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, Mar 01, 2021 at 05:24:41PM +0530, Viresh Kumar wrote:
> On 01-03-21, 14:41, Jie Deng wrote:
> > +/**
> > + * struct virtio_i2c_req - the virtio I2C request structure
> > + * @out_hdr: the OUT header of the virtio I2C message
> > + * @write_buf: contains one I2C segment being written to the device
> > + * @read_buf: contains one I2C segment being read from the device
> > + * @in_hdr: the IN header of the virtio I2C message
> > + */
> > +struct virtio_i2c_req {
> > +	struct virtio_i2c_out_hdr out_hdr;
> > +	u8 *write_buf;
> > +	u8 *read_buf;
> > +	struct virtio_i2c_in_hdr in_hdr;
> > +};
> =

> I am not able to appreciate the use of write/read bufs here as we
> aren't trying to read/write data in the same transaction. Why do we
> have two bufs here as well as in specs ?

I=B2C and SMBus support bidirectional transfers as well. I think two buffer=
s is
the right thing to do.

-- =

With Best Regards,
Andy Shevchenko


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
