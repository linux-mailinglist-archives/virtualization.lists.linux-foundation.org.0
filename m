Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC486298
	for <lists.virtualization@lfdr.de>; Thu,  8 Aug 2019 15:05:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C27411017;
	Thu,  8 Aug 2019 13:05:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 59F93F30
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 13:05:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DB66314D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 13:05:27 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d23so92056998qto.2
	for <virtualization@lists.linux-foundation.org>;
	Thu, 08 Aug 2019 06:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=9m6QChW1Hz/Ce2TOg5A9I+Mvna5Z6uz7U57CNrS3DMc=;
	b=UsXVcz/0fx+mbrQVrDfthdHqx/TQAG6mZCOjIrVyOeqqQ52UZpnPAoCRoyaHnv8XhS
	myAYX36Qc07br0W255vMKbULw2ztt1SK9LCxY6t+qNSGUH8lgf/3KrkhNmVLhnuXPk75
	8NKhNYfOP0paEoLotKXkfyPj6WC9fRZDjL/390dyyF/8bhzq6seIlrIR7AftrabVSUCt
	9CsyV03odYVVSHvklvyseXwr4U05s7IrXQRwta90NNKp3g9VPyivRSNNHC+ZMXAvgadj
	C7aT5FJ9sAlB+caYQhcUKnsovzehTBq/uSqC2bLHwecFVaJ/O/Uv9sooTvOk7mSYFNNc
	0qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=9m6QChW1Hz/Ce2TOg5A9I+Mvna5Z6uz7U57CNrS3DMc=;
	b=WiCa63hBl6riLp4TMZnge8DefYt4bytxcO3c0SsoUHWwpsy5RSqfLX/7NBrE2LITYy
	l8L0y5ffK0vw9xlqqLQ97UxsezHT6ecG4mcGI3xByz1swFpBLc3jAOeSUSJIR2DmPf5V
	U9yAVUl2nelOYwyWjKnkvBgfcvbjUupcL7TXb0QZvSVfYFgM8oNP1DAITzoPi1o450GT
	8fJ4sNw1QdfjLoW2wI8D7NkCXjLaMYm/YNumdA3K1iXM8S/r8CcHk4UgVHlqqrD6JEot
	sH+5BcPYA2oGwgqXp+4gdipXUqpUnsCCWhlyVo7+e3+OtO2aytxNuFLAuDzgFTNKylp2
	tf0Q==
X-Gm-Message-State: APjAAAULI2qTSiO34x8nfvlXWGzhd/jXKEB0lCwNbfi2IoQoWuix0cLu
	48AwWjVAseTr9sNJtW+qlUZ1Jw==
X-Google-Smtp-Source: APXvYqxk+1+rmZi904v8k29c8RjsPTgNO19TH+tlNz6F8hGZWv6LBYxggtUeflQkroZ7XbRUiUsHTA==
X-Received: by 2002:aed:3ed8:: with SMTP id o24mr12601256qtf.252.1565269526793;
	Thu, 08 Aug 2019 06:05:26 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100])
	by smtp.gmail.com with ESMTPSA id b1sm15328088qkk.8.2019.08.08.06.05.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 08 Aug 2019 06:05:26 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hvi6f-0003Ih-LV; Thu, 08 Aug 2019 10:05:25 -0300
Date: Thu, 8 Aug 2019 10:05:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V4 7/9] vhost: do not use RCU to synchronize MMU notifier
	with worker
Message-ID: <20190808130525.GA1989@ziepe.ca>
References: <20190807070617.23716-1-jasowang@redhat.com>
	<20190807070617.23716-8-jasowang@redhat.com>
	<20190807120738.GB1557@ziepe.ca>
	<ba5f375f-435a-91fd-7fca-bfab0915594b@redhat.com>
	<1000f8a3-19a9-0383-61e5-ba08ddc9fcba@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1000f8a3-19a9-0383-61e5-ba08ddc9fcba@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

T24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDg6NTQ6NTRQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKCj4gSSBkb24ndCBoYXZlIGFueSBvYmplY3Rpb24gdG8gY29udmVydMKgIHRvIHNwaW5sb2Nr
KCkgYnV0IGp1c3Qgd2FudCB0bwo+IGtub3cgaWYgYW55IGNhc2UgdGhhdCB0aGUgYWJvdmUgc21w
X21iKCkgKyBjb3VudGVyIGxvb2tzIGdvb2QgdG8geW91PwoKVGhpcyBlbWFpbCBpcyBob3JyaWJs
eSBtYW5nbGVkLCBidXQgSSBkb24ndCB0aGluayBtaXhpbmcgc21iX21iKCkgYW5kCnNtcF9sb2Fk
X2FjcXVpcmUoKSB3b3VsZCBiZSBjb25zaWRlcmQgYSBiZXN0LXByYWN0aWNlLCBhbmQgdXNpbmcK
c21wX3N0b3JlX3JlbGVhc2UoKSBpbnN0ZWFkIHdvdWxkIGJlIHRoZSB3cm9uZyBiYXJyaWVyLgoK
c3BpbmxvY2sgZG9lcyBzZWVtIHRvIGJlIHRoZSBvbmx5IGV4aXN0aW5nIGxvY2tpbmcgcHJpbWl0
aXZlIHRoYXQgZG9lcwp3aGF0IGlzIG5lZWRlZCBoZXJlLgoKSmFzb24KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
