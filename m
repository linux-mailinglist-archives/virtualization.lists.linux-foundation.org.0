Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EF74CAE3FD
	for <lists.virtualization@lfdr.de>; Tue, 10 Sep 2019 08:49:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9BBF4E24;
	Tue, 10 Sep 2019 06:49:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 079B0E17
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 06:49:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 97E2781A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 06:49:02 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE8773B3C0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 06:49:01 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id z128so7093744qke.8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 09 Sep 2019 23:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=dfiQALXz5+7KOgf5kpTvYt6Xu5cXYJTwms28arJUb+Y=;
	b=cvH6q+HAb7jRU9mCURaeYlYVTyQO3OFpVV9dYE+pRq1oTCW+y3onfPXMQAx3FVuwtc
	fFco2At3mZx9fwpLHRcEKqa/hVFt378qvSuqKGmneZMFJ39OtpLQSSlbj3UrdYZWS2JX
	Qoi2Ly3NMpb8pDRn8RovYiG2GCASFn5B8ERfPevlEjhijHK+GOMelDlNlnWL9U1o+tJD
	nwZ9Ola2YKr9iTQSI5MEXoIV03BQUZmfMFBJIGZg4f8s6Ot9oLabXrWTc9cltEeQlv1x
	FfrivE1JauNKS/HFOTwDVOH5akg5Q4mCVKLKvg5Dq5/ER+p7vsLEx2RotJVK2kDGWjMw
	ZLgQ==
X-Gm-Message-State: APjAAAWlq3T8VeYdqOoEua92fqIcqPD44B619+X+T5bNbzlaP2K/giWh
	hJlVgU5r+6CBSnZPkWHXbnY/xkh+zzys6t+Sda6bHXuvLXngLdJZptud/lxO/8V8SDBlRLznjfn
	/pWAoeiWfNAFqnyI+3dG06IG5ikfLOnPpQQvsKJAUgQ==
X-Received: by 2002:ac8:718c:: with SMTP id w12mr27618508qto.235.1568098141169;
	Mon, 09 Sep 2019 23:49:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzv6IYVdd0f5WQVUeM0vPrOJIlCYkZC8iTVcIPS0hC3pXejSbPr3ajEFZbHAbLF59dsjfyt7g==
X-Received: by 2002:ac8:718c:: with SMTP id w12mr27618495qto.235.1568098141014;
	Mon, 09 Sep 2019 23:49:01 -0700 (PDT)
Received: from redhat.com ([80.74.107.118])
	by smtp.gmail.com with ESMTPSA id l7sm8266259qke.67.2019.09.09.23.48.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 23:49:00 -0700 (PDT)
Date: Tue, 10 Sep 2019 02:48:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC PATCH untested] vhost: block speculation of translated
	descriptors
Message-ID: <20190910024814-mutt-send-email-mst@kernel.org>
References: <20190908110521.4031-1-mst@redhat.com>
	<db4d77d7-c467-935d-b4ae-1da7635e9b6b@redhat.com>
	<20190909104355-mutt-send-email-mst@kernel.org>
	<9ab48e0f-50a9-bed4-1801-73c37a7da27c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ab48e0f-50a9-bed4-1801-73c37a7da27c@redhat.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

T24gVHVlLCBTZXAgMTAsIDIwMTkgYXQgMDk6NTI6MTBBTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvOSDkuIvljYgxMDo0NSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gT24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDM6MTk6NTVQTSArMDgwMCwgSmFzb24gV2Fu
ZyB3cm90ZToKPiA+ID4gT24gMjAxOS85Lzgg5LiL5Y2INzowNSwgTWljaGFlbCBTLiBUc2lya2lu
IHdyb3RlOgo+ID4gPiA+IGlvdmVjIGFkZHJlc3NlcyBjb21pbmcgZnJvbSB2aG9zdCBhcmUgYXNz
dW1lZCB0byBiZQo+ID4gPiA+IHByZS12YWxpZGF0ZWQsIGJ1dCBpbiBmYWN0IGNhbiBiZSBzcGVj
dWxhdGVkIHRvIGEgdmFsdWUKPiA+ID4gPiBvdXQgb2YgcmFuZ2UuCj4gPiA+ID4gCj4gPiA+ID4g
VXNlcnNwYWNlIGFkZHJlc3MgYXJlIGxhdGVyIHZhbGlkYXRlZCB3aXRoIGFycmF5X2luZGV4X25v
c3BlYyBzbyB3ZSBjYW4KPiA+ID4gPiBiZSBzdXJlIGtlcm5lbCBpbmZvIGRvZXMgbm90IGxlYWsg
dGhyb3VnaCB0aGVzZSBhZGRyZXNzZXMsIGJ1dCB2aG9zdAo+ID4gPiA+IG11c3QgYWxzbyBub3Qg
bGVhayB1c2Vyc3BhY2UgaW5mbyBvdXRzaWRlIHRoZSBhbGxvd2VkIG1lbW9yeSB0YWJsZSB0bwo+
ID4gPiA+IGd1ZXN0cy4KPiA+ID4gPiAKPiA+ID4gPiBGb2xsb3dpbmcgdGhlIGRlZmVuY2UgaW4g
ZGVwdGggcHJpbmNpcGxlLCBtYWtlIHN1cmUKPiA+ID4gPiB0aGUgYWRkcmVzcyBpcyBub3QgdmFs
aWRhdGVkIG91dCBvZiBub2RlIHJhbmdlLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6
IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4g
ICAgZHJpdmVycy92aG9zdC92aG9zdC5jIHwgNCArKystCj4gPiA+ID4gICAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+IAo+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiA+
ID4gPiBpbmRleCA1ZGMxNzRhYzhjYWMuLjBlZTM3NWZiNzE0NSAxMDA2NDQKPiA+ID4gPiAtLS0g
YS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0
LmMKPiA+ID4gPiBAQCAtMjA3Miw3ICsyMDcyLDkgQEAgc3RhdGljIGludCB0cmFuc2xhdGVfZGVz
YyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwgdTY0IGFkZHIsIHUzMiBsZW4sCj4gPiA+ID4g
ICAgCQlzaXplID0gbm9kZS0+c2l6ZSAtIGFkZHIgKyBub2RlLT5zdGFydDsKPiA+ID4gPiAgICAJ
CV9pb3YtPmlvdl9sZW4gPSBtaW4oKHU2NClsZW4gLSBzLCBzaXplKTsKPiA+ID4gPiAgICAJCV9p
b3YtPmlvdl9iYXNlID0gKHZvaWQgX191c2VyICopKHVuc2lnbmVkIGxvbmcpCj4gPiA+ID4gLQkJ
CShub2RlLT51c2Vyc3BhY2VfYWRkciArIGFkZHIgLSBub2RlLT5zdGFydCk7Cj4gPiA+ID4gKwkJ
CShub2RlLT51c2Vyc3BhY2VfYWRkciArCj4gPiA+ID4gKwkJCSBhcnJheV9pbmRleF9ub3NwZWMo
YWRkciAtIG5vZGUtPnN0YXJ0LAo+ID4gPiA+ICsJCQkJCSAgICBub2RlLT5zaXplKSk7Cj4gPiA+
ID4gICAgCQlzICs9IHNpemU7Cj4gPiA+ID4gICAgCQlhZGRyICs9IHNpemU7Cj4gPiA+ID4gICAg
CQkrK3JldDsKPiA+ID4gCj4gPiA+IEkndmUgdHJpZWQgdGhpcyBvbiBLYWJ5IExha2Ugc21hcCBv
ZmYgbWV0YWRhdGEgYWNjZWxlcmF0aW9uIG9mZiB1c2luZwo+ID4gPiB0ZXN0cG1kICh2aXJ0aW8t
dXNlcikgKyB2aG9zdF9uZXQuIEkgZG9uJ3Qgc2VlIG9idmlvdXMgcGVyZm9ybWFuY2UKPiA+ID4g
ZGlmZmVyZW5jZSB3aXRoIFRYIFBQUy4KPiA+ID4gCj4gPiA+IFRoYW5rcwo+ID4gU2hvdWxkIEkg
cHVzaCB0aGlzIHRvIExpbnVzIHJpZ2h0IG5vdyB0aGVuPyBJdCdzIGEgc2VjdXJpdHkgdGhpbmcg
c28KPiA+IG1heWJlIHdlIGJldHRlciBkbyBpdCBBU0FQIC4uLiB3aGF0J3MgeW91ciBvcGluaW9u
Pwo+IAo+IAo+IFllcywgeW91IGNhbi4KPiAKPiBBY2tlZC1ieTogSmFzb24gV2FuZyA8amFzb3dh
bmdAcmVkaGF0LmNvbT4KCgpBbmQgc2hvdWxkIEkgaW5jbHVkZQoKVGVzdGVkLWJ5OiBKYXNvbiBX
YW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgoKPwoKPiAKPiAKPiA+IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxp
c3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0
cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
