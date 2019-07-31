Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DCE7CD0C
	for <lists.virtualization@lfdr.de>; Wed, 31 Jul 2019 21:44:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5D0D84173;
	Wed, 31 Jul 2019 19:43:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6A524415F
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 19:32:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E7BB06CE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 19:32:53 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id j8so27412762uan.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 12:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=c/NJmknjYXnLTaXRtiFYceCSSkLEpxXu+tMv/jvhB4c=;
	b=LI2KcArlX/KDX2TcyNDMmZ/ZE5cTjMJZAWURsjSV4Imlv9kH1NUViD2h4jhBiochFl
	PcBkIr6h+Ama1aEpsEKY0+YWcr4zGIYiDZeHjfAcoJ7D5bhZGrutuuXh2VyPBF/PGSWj
	rBFxsMepIBDKtn7K+Eb/QauyvOUUPBIaZeWYB7D9OTcRzYVrpta97Tts+NPdJEtxyeZT
	4mnFi5qkP9mb/xCWugLIcKxaQeVkFke1DMMaZqkdopWouBcYnmfoYEzQAihrW4DvwoYG
	gTaz79+pmrgYhwBHdPqps4krBCsM0VZnUBMsMvvHGss/KNwAXa5MNeRXmHLX55kimuyr
	zZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=c/NJmknjYXnLTaXRtiFYceCSSkLEpxXu+tMv/jvhB4c=;
	b=NtbAwdeYORZig1a5Ab+VMn/BNOhJDfQBI6r8hu7LFm6Ld8CIW5Tij1sPYbjnF7jeXm
	mr/1vKu6RquVdf9GSgaVm75A6cOLjR/XGJyAlNQXwUQEsdYZyPozFag4fA76XQ4tiU+z
	Hj5RcCo5MWZdyfwWR0JTIsTb6XN5JM2tWkKtk4QHvasRpKFeAu2WTFpwOvk3kHV3n05e
	teJSeAFomEUX4aJc7oTypmq77zhttDTNk/RcuJAk391pslfSZqcoUbr8GpIFnNucN1GI
	nurGtXvtX9hNkuftTVgehcf7GmDKeT53FnitS0ybhyUvWGebHV9dTC6Ylo2lpcvT4Xcd
	LIfQ==
X-Gm-Message-State: APjAAAVAQV0q7p6fvKRQKGT6CnVEhKFbseWcDiyT/L7fysN1oRjE9a1O
	bAxn3CmV0ML1gmjg2xizMBrhTt/2EII=
X-Google-Smtp-Source: APXvYqw7F0dP8sLkKJbAjJz+H7jEhemrR3x/a26pLVHnQrJcxOczpiTadHqsEDo3aJO4KIor71NCpQ==
X-Received: by 2002:ab0:67d6:: with SMTP id w22mr11381723uar.68.1564601573050; 
	Wed, 31 Jul 2019 12:32:53 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	g8sm21073143vkf.21.2019.07.31.12.32.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Jul 2019 12:32:52 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hsuLE-0007bw-8g; Wed, 31 Jul 2019 16:32:52 -0300
Date: Wed, 31 Jul 2019 16:32:52 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 4/9] vhost: reset invalidate_count in
	vhost_set_vring_num_addr()
Message-ID: <20190731193252.GH3946@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-5-jasowang@redhat.com>
	<20190731124124.GD3946@ziepe.ca>
	<31ef9ed4-d74a-3454-a57d-fa843a3a802b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31ef9ed4-d74a-3454-a57d-fa843a3a802b@redhat.com>
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

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDk6Mjk6MjhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzcvMzEg5LiL5Y2IODo0MSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+
ID4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDQ6NDY6NTBBTSAtMDQwMCwgSmFzb24gV2FuZyB3
cm90ZToKPiA+ID4gVGhlIHZob3N0X3NldF92cmluZ19udW1fYWRkcigpIGNvdWxkIGJlIGNhbGxl
ZCBpbiB0aGUgbWlkZGxlIG9mCj4gPiA+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKSBhbmQgaW52
YWxpZGF0ZV9yYW5nZV9lbmQoKS4gSWYgd2UgZG9uJ3QgcmVzZXQKPiA+ID4gaW52YWxpZGF0ZV9j
b3VudCBhZnRlciB0aGUgdW4tcmVnaXN0ZXJpbmcgb2YgTU1VIG5vdGlmaWVyLCB0aGUKPiA+ID4g
aW52YWxpZGF0ZV9jb250IHdpbGwgcnVuIG91dCBvZiBzeW5jIChlLmcgbmV2ZXIgcmVhY2ggemVy
bykuIFRoaXMgd2lsbAo+ID4gPiBpbiBmYWN0IGRpc2FibGUgdGhlIGZhc3QgYWNjZXNzb3IgcGF0
aC4gRml4aW5nIGJ5IHJlc2V0IHRoZSBjb3VudCB0bwo+ID4gPiB6ZXJvLgo+ID4gPiAKPiA+ID4g
UmVwb3J0ZWQtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gPiBEaWQg
TWljaGFlbCByZXBvcnQgdGhpcyBhcyB3ZWxsPwo+IAo+IAo+IENvcnJlY3QgbWUgaWYgSSB3YXMg
d3JvbmcuIEkgdGhpbmsgaXQncyBwb2ludCA0IGRlc2NyaWJlZCBpbgo+IGh0dHBzOi8vbGttbC5v
cmcvbGttbC8yMDE5LzcvMjEvMjUuCgpJJ20gbm90IHN1cmUgd2hhdCB0aGF0IGlzIHRhbGtpbmcg
YWJvdXQKCkJ1dCB0aGlzIGZpeGVzIHdoYXQgSSBkZXNjcmliZWQ6CgpodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAxOS83LzIyLzU1NAoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
