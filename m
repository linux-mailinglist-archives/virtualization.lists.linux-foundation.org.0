Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2473D51FF
	for <lists.virtualization@lfdr.de>; Mon, 26 Jul 2021 05:59:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C59B1400AF;
	Mon, 26 Jul 2021 03:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oF9DNX9hMeBy; Mon, 26 Jul 2021 03:59:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 956ED40272;
	Mon, 26 Jul 2021 03:59:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E500C0022;
	Mon, 26 Jul 2021 03:59:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0762C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 03:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99B41400E8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 03:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkEYYvhs7sH0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 03:59:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2EB5400AF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 03:59:06 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id n10so2367831plc.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 25 Jul 2021 20:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6b6G7xsuI/npQw8leSBd2R5w5X77r6uj+WW4obPWFsw=;
 b=VQkpuFkYjvVU0ufuNZMY7yM/t2vY0VdkA1BnbAzxTtCkrT1U6fCjGg49ga7dSMJnQG
 3uCpatpwAP5VkpnYnMsgudFgYvX9LiHzc2pjIpK6HoS68+OxPyxkYHEedEYS/CbS8IRt
 bMPi/IFA4puY8eLwO9yy/M40y/Vv9cZRsNAmoI41KyCFuDbQQm11MET73wzTrlhhP1Wb
 8IeUPeSJyS7wqJCNcWTWo7Izvlw1k9IHp1xrbqs+Vft5L20IDFMJk8xD5btpWkMiMwtm
 VE2zCqS/DTyMIGuYOvDZ4feGrG4RFIFgP3HdNY87Hf458Lihrt6aSa58aFEPqP9XO2mB
 /mJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6b6G7xsuI/npQw8leSBd2R5w5X77r6uj+WW4obPWFsw=;
 b=QE1s1UoqHKoKwQaOMOZZaKa5GQB2qNgcyIiCFp3qwZWuBIs4i09htlmolgHmhoY2y7
 ZuQ/v72kOe22lkNBeDMfFB8zReCEJcm36m6F4lUgx7e/SeH6u5/xqwBMdHToEpgEHG9q
 QrEWT7JNwUVk9qegjKBawuBpqM0CxxTRRuJqZLVO9JUwXJbepOSuq1Gj+0V/nCTvOUj7
 FVfmIAxZUiv+U82vh4mGnlxwru+9dAeE17obgGAuV+wqPqrCxVNhjTV4rI/WKjcXsj1a
 u1gnpDqX2mVlg7uVnzGnTR/gwHbfWQHHy2rd44uYzEhApUrMPSOfCOl/JQzrgV4rzV4Q
 8+0A==
X-Gm-Message-State: AOAM533PENT8ncuzWRksnNKyMaI/mw2i7ZxIzeSUJktVSqaGVcJ2KfnK
 PQMVjv7Hv/Ztfq8fK6CKTL/LRw==
X-Google-Smtp-Source: ABdhPJzMUxri6/V8qt5gZUc8Gv7kxqmxbKkJVX/Y+NwcW2h5Cwsik9jvRxSWDPTTYYWKygEgWqvVVQ==
X-Received: by 2002:a17:90a:f011:: with SMTP id
 bt17mr4259246pjb.105.1627271946201; 
 Sun, 25 Jul 2021 20:59:06 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id g18sm40050802pfi.199.2021.07.25.20.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:59:05 -0700 (PDT)
Date: Mon, 26 Jul 2021 09:29:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v15] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210726035902.b6zo72r6mdlxyf7w@vireshk-i7>
References: <bcf2fb9bbe965862213f27e05f87ffc91283c0c5.1627018061.git.jie.deng@intel.com>
 <CAK8P3a1=TpKLGMzvoLafjxtmoBbDL+sBMb8ZiEmTjW91Yr-cYw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1=TpKLGMzvoLafjxtmoBbDL+sBMb8ZiEmTjW91Yr-cYw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, gregkh <gregkh@linuxfoundation.org>,
 jiedeng@alumni.sjtu.edu.cn,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, Wolfram Sang <wsa@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, conghui.chen@intel.com,
 yu1.wang@intel.com
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

On 23-07-21, 11:03, Arnd Bergmann wrote:
> > index 70a8057a..99aa27b 100644
> > --- a/include/uapi/linux/virtio_ids.h
> > +++ b/include/uapi/linux/virtio_ids.h
> > @@ -55,6 +55,7 @@
> >  #define VIRTIO_ID_FS                   26 /* virtio filesystem */
> >  #define VIRTIO_ID_PMEM                 27 /* virtio pmem */
> >  #define VIRTIO_ID_MAC80211_HWSIM       29 /* virtio mac80211-hwsim */
> > +#define VIRTIO_ID_I2C_ADAPTER          34 /* virtio i2c adapter */
> >  #define VIRTIO_ID_BT                   40 /* virtio bluetooth */
> 
> This will now conflict with Viresh's patch that adds all the other IDs.
> Not sure if there is anything to be done about that.

An easier way of avoiding all such conflicts can be:

- Michael applies my first patch (which sync's the device id's from specs) for
  5.14-rc4. Rest of the patches can go for 5.15.

- And then Wolfram applies this series over rc4 instead of rc1.

Or we can leave the conflict there for Linus to handle.

-- 
viresh
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
