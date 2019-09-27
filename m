Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 11899C066E
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 15:37:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A8F741010;
	Fri, 27 Sep 2019 13:37:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6DA5BB43
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:37:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 31E6A8CB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:37:03 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b128so1630478pfa.1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 06:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=1T4A7cJVny4HjoF6OxbZSvzZ4Y1UkSovrypWVv8gRbg=;
	b=SWHoTDkzvBeJqcKPvZyrZkqOXVuUR6EBz5Su5woWjy5/rlfjYqhJ2wrRV6QL49nhm/
	bmfVbWGQ80YsKhDtpdgxr2JPTeVvzmLjzo11RPLSYELKno6cG5gS39en6vGS9Ws2tI7y
	Q3teZwh7rTRO7526AepG31Ox+EfGaE91R319M/5yyI6oLyKjFsqd3567mzORAQMh2czy
	spYWVD18HN6drbWfdRn4j66y1sn1JYs4bSb8ScSeHaw2j+X7xERn4eSJHxbWA4Rikw/d
	X00ScOTt2TAIH1I3zTPkCQ039dg8kk5sOkG9lPv74ltkOD0B53ydCSqlQO1JNKKkRMS1
	Ppyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=1T4A7cJVny4HjoF6OxbZSvzZ4Y1UkSovrypWVv8gRbg=;
	b=Bpm5NKJOYm2LXHb3m7hBPu3KPmE1ZmNvPe5A/7Q0U73pmLww+3qK7tUfqlc5msxfVb
	h3yrRyZEfYohQ6QIt2E/8niB6R+u0KvUXTCQFitdjv9DsQJe8ClDO3NQ5FOtqCxV7G4e
	lI/A5Kj+kS9RnNGCGnhUYblCqoU7DKaB5H0x9+95Jrr9DFJ83hI7TEfIcFymU9Y+Z22W
	PL+Zwg64QCkt2jsHLBgKaunZaP6YIS7tTkuO2qJHFTxa3IxAvGohpfMm4uO1SVc6KrML
	qXSS6FgTdd6Ho6OD8ikhEI0ZwhFyqFfV/6I2HJaKJj5cGoV1trYsXUZLJdY6fual/RNc
	PY6g==
X-Gm-Message-State: APjAAAV0iYDrB5HA4AJLNTFDD7OLMpL7YRyjq0ONinXTj+RTmrTp9+69
	KC+26lqH6ZHlSYa66WlWn10=
X-Google-Smtp-Source: APXvYqxUe7IKGHke3pkjd7PB0Ez46t+eLGYbvjqmLd4GYHlniOt1U8vXke2M0+FVndZs0g3h/TAyRw==
X-Received: by 2002:a65:5043:: with SMTP id k3mr9570894pgo.406.1569591422724; 
	Fri, 27 Sep 2019 06:37:02 -0700 (PDT)
Received: from [192.168.86.235] (c-73-241-150-70.hsd1.ca.comcast.net.
	[73.241.150.70])
	by smtp.gmail.com with ESMTPSA id v9sm2605962pfe.1.2019.09.27.06.37.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 27 Sep 2019 06:37:01 -0700 (PDT)
Subject: Re: [PATCH] vsock/virtio: add support for MSG_PEEK
To: Stefano Garzarella <sgarzare@redhat.com>,
	Eric Dumazet <eric.dumazet@gmail.com>,
	Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
References: <1569522214-28223-1-git-send-email-matiasevara@gmail.com>
	<f069a65d-33b9-1fa8-d26e-b76cc51fc7cb@gmail.com>
	<20190927085513.tdiofiisrpyehfe5@steredhat.homenet.telecomitalia.it>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <a7a77f0b-a658-6e46-3381-3dfea55b14d1@gmail.com>
Date: Fri, 27 Sep 2019 06:37:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927085513.tdiofiisrpyehfe5@steredhat.homenet.telecomitalia.it>
Content-Language: en-US
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



On 9/27/19 1:55 AM, Stefano Garzarella wrote:

> Good catch!
> 
> Maybe we can solve in this way:
> 
> 	list_for_each_entry(pkt, &vvs->rx_queue, list) {
> 		size_t off = pkt->off;
> 
> 		if (total == len)
> 			break;
> 
> 		while (total < len && off < pkt->len) {
> 			/* using 'off' instead of 'pkt->off' */
> 			...
> 
> 			total += bytes;
> 			off += bytes;
> 		}
> 	}
> 
> What do you think?
>

Maybe, but I need to see a complete patch, evil is in the details :)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
