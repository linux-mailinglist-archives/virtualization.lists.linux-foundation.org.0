Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD6A3B710D
	for <lists.virtualization@lfdr.de>; Tue, 29 Jun 2021 12:56:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD8FB607CF;
	Tue, 29 Jun 2021 10:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yv6W5HCaHuQj; Tue, 29 Jun 2021 10:56:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A477B607D4;
	Tue, 29 Jun 2021 10:56:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 421CFC0022;
	Tue, 29 Jun 2021 10:56:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50E19C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 10:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B040607CF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 10:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A966__whjwQf
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 10:56:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15899607ED
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 10:56:52 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id y4so16849003pfi.9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Jun 2021 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Jc3NxCk+KDZnIQDnHNRavHi5mkTsU8gdZSOVUuYmb/Q=;
 b=QS9szzKZkwbuUl6cKd5ztj/xB9uMz9A1jTb+bhp/iKdt6UXXCDtfbkgpYSl9Ld+viw
 6wm5vnieXa0uuthxGAsd2dKH5l1eiA5nEb/Q01RIm+4sRZOun/GGl0IoKejxx6PU/Cxi
 KwW+NE7q5y9MFmWzZwJ/lOLR6FezFPiwFKp36Ggo57oNbkpfTdkz/yl0ZVaty0BvAd0Q
 tkint4nL99vAdnuiwBtQONS1EyfJelM8ZYkTwrROgl/HDIykl+FUEmL3aXcw5DRa/mvE
 VkMMefHA41nC0ZWHpWASXk0mnM1R+U1S1zX3LjB0QOklwhgqe/MbW7AabHCf9G6KZz9/
 kW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Jc3NxCk+KDZnIQDnHNRavHi5mkTsU8gdZSOVUuYmb/Q=;
 b=cYQU+Rkcq6cAoj8E4GT9mrD+AA6PhJxEaP4cWYcDJQLQeF+SaccbQMsMsT6T4vYr2x
 J8UqXeS3nuKdx0PkHYs/sQb3MyTdZRv2dgAHyNFPXb7Se/gzwLvI215idemwh/pAfPTx
 xbMx+vOHgHJ2cfYT8glZEGKcWFWFgMNBdygsUYXnfKyMciDGjPoQnR5kL2W/dNnpagMg
 bmINfPudlVCFZiXmeX5TEqaFUbuvaAT9b1QvjkRMOxWpRiJeDw4bJoVCrGgKrHifGHdy
 awddf5SQMaBDAt8iTUBL0NoZPinslVdnSlDZrGwuVvDbmQYZ8luBRa55+ZC528i1aS4C
 uXLA==
X-Gm-Message-State: AOAM530q38N+cpQo/uXffSDrWjSoaCyValMtX+lUBB1KCWS2+fFzvbq7
 qLnKCQZUK22Tr8g7z/rM6BKQFQ==
X-Google-Smtp-Source: ABdhPJztQOYmtid8VFswfwsuX0Ti0CJClj3s+tJOjyJNAmsG+72+n65kqxZFjJN+ujUm53A0wuaxzw==
X-Received: by 2002:a63:5616:: with SMTP id k22mr27766655pgb.41.1624964212463; 
 Tue, 29 Jun 2021 03:56:52 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id w123sm17955912pff.186.2021.06.29.03.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 03:56:51 -0700 (PDT)
Date: Tue, 29 Jun 2021 16:26:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wolfram Sang <wsa@kernel.org>, Jie Deng <jie.deng@intel.com>,
 linux-i2c@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, mst@redhat.com, jasowang@redhat.com,
 andriy.shevchenko@linux.intel.com, conghui.chen@intel.com,
 arnd@arndb.de, kblaiech@mellanox.com, jarkko.nikula@linux.intel.com,
 Sergey.Semin@baikalelectronics.ru, rppt@kernel.org,
 loic.poulain@linaro.org, tali.perry1@gmail.com,
 u.kleine-koenig@pengutronix.de, bjorn.andersson@linaro.org,
 yu1.wang@intel.com, shuo.a.liu@intel.com, stefanha@redhat.com,
 pbonzini@redhat.com
Subject: Re: [PATCH v10] i2c: virtio: add a virtio i2c frontend driver
Message-ID: <20210629105649.nt63mxtiy6u7de3g@vireshk-i7>
References: <226a8d5663b7bb6f5d06ede7701eedb18d1bafa1.1616493817.git.jie.deng@intel.com>
 <YNrw4rxihFLuqLtY@ninjato>
 <20210629101627.kwc2rszborc3kvjs@vireshk-i7>
 <YNr0uDx1fv+Gjd7m@ninjato>
 <20210629103014.nlk3mpetydc4mi6l@vireshk-i7>
 <YNr5Jf3WDTH7U5b7@ninjato> <YNr5ZRhT3qn+e9/m@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNr5ZRhT3qn+e9/m@ninjato>
User-Agent: NeoMutt/20180716-391-311a52
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

On 29-06-21, 12:43, Wolfram Sang wrote:
> 
> > From the spec:
> > 
> > The case when ``length of \field{write_buf}''=0, and at the same time,
> > ``length of \field{read_buf}''=0 doesn't make any sense.
> > 
> > I mentioned this in my first reply and to my understanding I did not get
> > a reply that this has changed meanwhile.
> > 
> 
> Also, this code as mentioned before:
> 
> > +             if (!msgs[i].len)
> > +                     break;
> 
> I hope this can extended in the future to allow zero-length messages. If
> this is impossible we need to set an adapter quirk instead.

Ahh, yeah I saw these messages but I wasn't able to relate them to the
I2C_FUNC_SMBUS_QUICK thing. My bad.

Looked at Spec, Linux driver and my backends, I don't there is
anything that breaks if we allow this. So the best thing (looking
ahead) is if Jie sends a patch for spec to be modified like this.

The case when ``length of \field{write_buf}''=0, and at the same time,
``length of \field{read_buf}''=0 is called not-a-read-write request
and result for such a request is I2C device specific.

-- 
viresh
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
