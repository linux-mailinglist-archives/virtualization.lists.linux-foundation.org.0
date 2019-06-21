Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 488F54DE24
	for <lists.virtualization@lfdr.de>; Fri, 21 Jun 2019 02:42:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2CE47B6D;
	Fri, 21 Jun 2019 00:42:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0ABF4AD7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 00:42:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A5EAD27B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 21 Jun 2019 00:42:20 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id w25so2854849ioc.8
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 17:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=fCNHOZHMZbkI2r13lZfSqE17QUXUQLFaOs3rdEwJpus=;
	b=IGxqFxBxOptZk5udL8dE4lm+pE+RCYWyMHTJDGvn8C3Tfq7sOTUyBPSoHlLqpenFds
	pztZvILOv+uRerFQgRTtGEh5DoiKbwXSeM/OOfHwbTtNuJ3oW/ykAAoW7HS2EkelU0lj
	QrAM5OwpbnmO/j/o5WcdMR9jVWXtA1ytD/l8LCFFEev1Q2irfKHHw1SjjxkllEgSpZZo
	lbOeJlP7ymRufmnR5QX9D6OxfqPARszGNIDcyW+NzKrezmOMK130esomdzMKH7orQo5A
	IEqoSDqYJKUNqQOPBkyoynQ91foMI+iz/NvWROHd3UR/upZ3QGb3MixPFqRToir28dg+
	ksdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fCNHOZHMZbkI2r13lZfSqE17QUXUQLFaOs3rdEwJpus=;
	b=bhPsaYUw+WObMA3y+O9JvphDmRYdltIPR1KqPs3537jIAXA4rYmQXmahf0cq8P8KVy
	97pjyjKnXEyqO3JQzR/tmeG0wNvz49LxOGurhiBcgtXG0krLo6syKXTLG2g+1Yxc2D/V
	0krkY2F8WhaCPe7+e8iEVZOf1oLqvfvC2zKWG39L6PO94nCf/GqAfCInfv5Lu4ZDz69n
	0J8qCi0RKS2z+AKoydvxWoxOno+NSeF3H6GVuAF6DnlLTPEgo73lj5OuL5g1JNqcHxzU
	bgyDAliP5ZGxhklxDOoKFTVmu+bs2inViCR02+Q+fZrZO/Tnv6sl2H4ON9n5JasU7NSm
	0gag==
X-Gm-Message-State: APjAAAWdJdNvtvhErAUj9ca1d7eGqdX8o1bev70GfImls0V0Rz+ODBCE
	4dANOij5h2SE9om7ccgBTWs=
X-Google-Smtp-Source: APXvYqxH8+H9FT9zH21j/35x/Xzu8F1AODugL2iGQ6Ym7P+SabPBsYmRexEkTiLMzFC1NcLPYjwJLQ==
X-Received: by 2002:a5d:9448:: with SMTP id x8mr22299537ior.102.1561077740103; 
	Thu, 20 Jun 2019 17:42:20 -0700 (PDT)
Received: from ?IPv6:2601:284:8200:5cfb:4cec:f7ec:4bbc:cb19?
	([2601:284:8200:5cfb:4cec:f7ec:4bbc:cb19])
	by smtp.googlemail.com with ESMTPSA id
	w23sm1212906iod.12.2019.06.20.17.42.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jun 2019 17:42:19 -0700 (PDT)
Subject: Re: Stats for XDP actions
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@redhat.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>
References: <1548934830-2389-1-git-send-email-makita.toshiaki@lab.ntt.co.jp>
	<20190131101516-mutt-send-email-mst@kernel.org>
	<20190131.094523.2248120325911339180.davem@davemloft.net>
	<20190131211555.3b15c81f@carbon>
	<b8c97120-851f-450f-dc71-59350236329e@gmail.com>
	<20190204125307.08492005@redhat.com>
	<bdcfedd6-465d-4485-e268-25c4ce6b9fcf@gmail.com>
	<87tvevpf0y.fsf@toke.dk>
	<44ae964a-d3dd-6b7f-4bcc-21e07525bf41@gmail.com>
	<87sgs46la6.fsf@toke.dk>
From: David Ahern <dsahern@gmail.com>
Message-ID: <cd9136ff-4127-72a5-0857-2e5641ba5252@gmail.com>
Date: Thu, 20 Jun 2019 18:42:18 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <87sgs46la6.fsf@toke.dk>
Content-Language: en-US
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>, hawk@kernel.org,
	mst@redhat.com, netdev@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	virtualization@lists.linux-foundation.org,
	Saeed Mahameed <saeedm@mellanox.com>, makita.toshiaki@lab.ntt.co.jp,
	Daniel Borkmann <borkmann@iogearbox.net>,
	David Miller <davem@davemloft.net>, Tariq Toukan <tariqt@mellanox.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gNi8yMC8xOSAyOjQyIFBNLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+PiBJ
IGRvbid0IHJlY2FsbCBzZWVpbmcgYW55IGZvbGxvdy11cCBvbiB0aGlzLiBEaWQgeW91IGhhdmUg
YSBjaGFuY2UgdG8KPj4+IGZvcm11bGF0ZSB5b3VyIGlkZWFzPyA6KQo+Pj4KPj4KPj4gTm90IHll
dC4gQWxtb3N0IGRvbmUgd2l0aCB0aGUgbmV4dGhvcCBjaGFuZ2VzLiBPbmNlIHRoYXQgaXMgb3V0
IG9mIHRoZQo+PiB3YXkgSSBjYW4gY29tZSBiYWNrIHRvIHRoaXMuCj4gCj4gUGluZz8gOikKPiAK
CkRlZmluaXRlbHkgYmFjayB0byB0aGlzIGFmdGVyIHRoZSBKdWx5IDR0aCBob2xpZGF5LgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlv
biBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcK
aHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVh
bGl6YXRpb24=
