Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B14463CF5
	for <lists.virtualization@lfdr.de>; Tue, 30 Nov 2021 18:38:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2E6B82A7F;
	Tue, 30 Nov 2021 17:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 69snCRDYTJj8; Tue, 30 Nov 2021 17:38:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9DB9B82A87;
	Tue, 30 Nov 2021 17:38:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13D97C0030;
	Tue, 30 Nov 2021 17:38:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC772C000A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Nov 2021 17:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85D3D61BB9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Nov 2021 17:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXbVn6egUfpO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Nov 2021 17:38:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D007661BAE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Nov 2021 17:38:18 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id bj13so42725720oib.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Nov 2021 09:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9yGsC6D7YcOedaCUxwHy8rpPCvqA2k0rkOUjWSThB+4=;
 b=M+M3zT55J2QxB8HMlADYhY7i1nGcnxOCpuvuHTowOML7H3UYCOQgrJcI2X+ccSVsZY
 ygGzn7P/NwfLBZiKv0xN3bAu/yT1O4cWaGAiz1Z+n7Zz1fBJnUFgK4ktEUqA/uKiMuOw
 HeBXDWEDa/7qgzCw+qANz9vtthuz5AqydpHmf8zg2n91jFYKnMJzQRacCC028hwCoYOi
 KZqO8dGkgGXeny/HL4nM9D2TvJLdaMTmjh9GYvc8OkchCVe5C7y5mL1/eXBrGqlV/2O1
 /8hy+bINrdZr5g1BrVYz3RktocUD4jLwHPDv8a7X0n+AGGR5JYKRlH2dW/WyvBP7bRJR
 Hukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9yGsC6D7YcOedaCUxwHy8rpPCvqA2k0rkOUjWSThB+4=;
 b=DIfreza4R3FOX6wQR3Mrub3ZweYkn9zm61ACLShmK3x0JirK4oc7vQesVS460Pz3T4
 Zhu6k2TJ/PWFDZu/zR3vGxT9RyADXmIs9tL6Gt9Jy3IV3mQfMXawEFOsWsDdvlYeCKwa
 PPB27GepYbPBh7QGAvhCDrZFafE2v8ZaCXMw+upgxhVFtQt/biic+qiWZs+djmT50sF+
 zXMuq+5EqbDHgp2IShbHD2cw+utneJktpS8KEH7NBRYlhcrk59LdEf5IzEl504zw6vv6
 fLOjJEQlt3LLQgS7UwJ21pVvl3xKG8GrwLQFBv2NDwHtUr/IA3HJ3E5d6j8fbSi9yUv4
 AmvA==
X-Gm-Message-State: AOAM530h+1u9HWJAxuTGdXgxtDsc/I87Z4PdqWW76J5/FAjkzsaQ4IK+
 KWHjXgRH3tt2MFuJljGX/AU=
X-Google-Smtp-Source: ABdhPJyGUDiBcRXjb78HKBVv0Vo8IF+yfoYemWY83wRl492HqCJi/MbSLqMh4aR1q9XhY4QuhyzZ4g==
X-Received: by 2002:a05:6808:1784:: with SMTP id
 bg4mr354985oib.70.1638293897903; 
 Tue, 30 Nov 2021 09:38:17 -0800 (PST)
Received: from [172.16.0.2] ([8.48.134.30])
 by smtp.googlemail.com with ESMTPSA id bf17sm4100632oib.27.2021.11.30.09.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 09:38:17 -0800 (PST)
Message-ID: <18655462-c72e-1d26-5b59-d03eb993d832@gmail.com>
Date: Tue, 30 Nov 2021 10:38:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v2 net-next 00/26] net: introduce and use generic XDP stats
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>,
 Alexander Lobakin <alexandr.lobakin@intel.com>
References: <20211123163955.154512-1-alexandr.lobakin@intel.com>
 <20211130155612.594688-1-alexandr.lobakin@intel.com>
 <20211130081207.228f42ba@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <20211130163454.595897-1-alexandr.lobakin@intel.com>
 <20211130090449.58a8327d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: David Ahern <dsahern@gmail.com>
In-Reply-To: <20211130090449.58a8327d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Cc: Song Liu <songliubraving@fb.com>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Alexei Starovoitov <ast@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Andrei Vagin <avagin@gmail.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Arthur Kiyanovski <akiyano@amazon.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Noam Dagan <ndagan@amazon.com>,
 Cong Wang <cong.wang@bytedance.com>, Martin Habets <habetsm.xilinx@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Johannes Berg <johannes.berg@intel.com>, KP Singh <kpsingh@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Yonghong Song <yhs@fb.com>, Shay Agroskin <shayagr@amazon.com>,
 Marcin Wojtas <mw@semihalf.com>, Leon Romanovsky <leon@kernel.org>,
 David Arinzon <darinzon@amazon.com>, David Ahern <dsahern@kernel.org>,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Martin KaFai Lau <kafai@fb.com>, Edward Cree <ecree.xilinx@gmail.com>,
 Yajun Deng <yajun.deng@linux.dev>, netdev@vger.kernel.org,
 Saeed Bishara <saeedb@amazon.com>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>, bpf@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>, "David S. Miller" <davem@davemloft.net>
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

On 11/30/21 10:04 AM, Jakub Kicinski wrote:
> On Tue, 30 Nov 2021 17:34:54 +0100 Alexander Lobakin wrote:
>>> Another thought on this patch: with individual attributes you could save
>>> some overhead by not sending 0 counters to userspace. e.g., define a
>>> helper that does:  
>>
>> I know about ETHTOOL_STAT_NOT_SET, but RTNL xstats doesn't use this,
>> does it?
> 
> Not sure if you're asking me or Dave but no, to my knowledge RTNL does
> not use such semantics today. But the reason is mostly because there
> weren't many driver stats added there. Knowing if an error counter is
> not supported or supporter and 0 is important for monitoring. Even if
> XDP stats don't have a counter which may not be supported today it's
> not a good precedent to make IMO.
> 

Today, stats are sent as a struct so skipping stats whose value is 0 is
not an option. When using individual attributes for the counters this
becomes an option. Given there is no value in sending '0' why do it?

Is your pushback that there should be a uapi to opt-in to this behavior?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
