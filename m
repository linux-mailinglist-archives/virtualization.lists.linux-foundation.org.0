Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BC7C08BC
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 17:39:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 796FFBA0;
	Fri, 27 Sep 2019 15:39:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7C2BFB4B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 15:38:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0D8888AB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 15:38:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l3so3510909wru.7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=WqPr3BMmdkR12PG5X2wdgv7YTpsF0EmWkLgo4C5gGm8=;
	b=bMQzQjPTyXrKf1113+kG9uJO8Hd1tIflR8zyeoX13anoPf8nfo7xZktTt00/8etwVx
	f/86eU6y2vPTGWaqDrWTFBfeaUweWBKJVnSS5hkOwuSa1uodSyzGnITqsdwzp/EImrUr
	Hj1y7tmAXpfSH9RJ2v66esgn2iBI82gvW2A7NCSfd6BFvWq3nUFGTU29pv7n4CPB1umv
	pZH4xLWfX5teemBDnprRU+viEUq1AyriytkLocg5STufvSIFP3R4Hq5EwGeGFyaQKB1I
	GkHy2vxG6imthBzN7yzeYk4th90kYWiphjViudxatmJ3SO6oMbT54ZWWAEUKQsCXf6yS
	TD3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=WqPr3BMmdkR12PG5X2wdgv7YTpsF0EmWkLgo4C5gGm8=;
	b=dytjDxOTo3/kNcb6PiFuoPzBr63Q5PjeMhWRJ7w2ng6HeG0NNKqTJgKUhme1kXEWYQ
	Rz5c71E431MBF1erpnwQDqNBz2N8ieVqLytGqVyE+K0DtNxtIe3qsyDlkWJOJvi5LaFB
	rT8zZd63scqsCjGiK2Wc9u2rcwBnlQLXKBwcpKAl281E6dGPIwTDvzCH35f1yfteeMwK
	lui48+n87LW8DhvAV4ZbCVcHTbD/y0CnHpiKfozqNr0fGIVfUtnbeHzGV+Kh2lbxMadt
	tmdm4Urdx3lzbzKxx1ijc0Ww5sIHuXubXeB6JGmAiwIpKHtF0ccmzCRGuZM8AtGCNHwi
	tL5A==
X-Gm-Message-State: APjAAAWs7WZWGtt1FqJy9Lv5wCS51W9eaPPevZMEzh5urDJJgqgP6DVO
	/CqyMjEfbxNI1sjlcAVnHFc=
X-Google-Smtp-Source: APXvYqytcVLtWlyBJYAkuqwx6A2Onw/qBy8K4tRZvRbkGWY98IIBO5iTmei7P0b/bbu1gpKiddducg==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr8198204wmi.39.1569598737528; 
	Fri, 27 Sep 2019 08:38:57 -0700 (PDT)
Received: from scw-93ddc8.cloud.online.net ([2001:bc8:4400:2400::302d])
	by smtp.gmail.com with ESMTPSA id z1sm6009561wre.40.2019.09.27.08.38.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Sep 2019 08:38:56 -0700 (PDT)
Date: Fri, 27 Sep 2019 15:38:43 +0000
From: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
To: Eric Dumazet <eric.dumazet@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH] vsock/virtio: add support for MSG_PEEK
Message-ID: <20190927153843.GA15350@scw-93ddc8.cloud.online.net>
References: <1569522214-28223-1-git-send-email-matiasevara@gmail.com>
	<f069a65d-33b9-1fa8-d26e-b76cc51fc7cb@gmail.com>
	<20190927085513.tdiofiisrpyehfe5@steredhat.homenet.telecomitalia.it>
	<a7a77f0b-a658-6e46-3381-3dfea55b14d1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7a77f0b-a658-6e46-3381-3dfea55b14d1@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com,
	davem@davemloft.net
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, Sep 27, 2019 at 06:37:00AM -0700, Eric Dumazet wrote:
> 
> 
> On 9/27/19 1:55 AM, Stefano Garzarella wrote:
> 
> > Good catch!
> > 
> > Maybe we can solve in this way:
> > 
> > 	list_for_each_entry(pkt, &vvs->rx_queue, list) {
> > 		size_t off = pkt->off;
> > 
> > 		if (total == len)
> > 			break;
> > 
> > 		while (total < len && off < pkt->len) {
> > 			/* using 'off' instead of 'pkt->off' */
> > 			...
> > 
> > 			total += bytes;
> > 			off += bytes;
> > 		}
> > 	}
> > 
> > What do you think?
> >
> 
> Maybe, but I need to see a complete patch, evil is in the details :)
>

Thanks both for your comments, I will take them into account and submit
a second version. 

Matias
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
