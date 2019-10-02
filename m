Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B128C8A17
	for <lists.virtualization@lfdr.de>; Wed,  2 Oct 2019 15:46:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D6181ED1;
	Wed,  2 Oct 2019 13:46:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1BD4AD8E
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 13:46:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8D539189
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 13:46:37 +0000 (UTC)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
	[209.85.221.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B11C811A24
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 13:46:36 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id q8so783566wrp.8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 02 Oct 2019 06:46:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=kPx8eHGD2bHazCr1CGLJp8Q8NfVHXws6Datb9inEIfY=;
	b=pkmfMNVmt3rqTbWaWkCkyofFC4rAHHUnrShbgmBuiaSIFx9SSIgBlz+5Yj3Qws5m+d
	ZOg+RyWq6c4hxZnb4B6fokZEFQDrLHstkgfF8th6nUU2FYtlHF9ZJonPNgo/POhgRFaq
	eeATyGTXgi58ACNCt9W7/HSpwghP3I4eNA4TPYFjNDeK6AxLVFrutZhsARupJ7WLtS3N
	U3gA01utFBOCgsxFJ/0DalUGmjrtespwByocjm15O9y2O9VgDlxjpG8uO5HWGuqCNhHp
	BMmuU+zE0eXOllIYOrbGEbbs5NBJleHM0s0WjcBmnY++Q2HmttR6tNcJUFs4FuNTG+wz
	FWxA==
X-Gm-Message-State: APjAAAXCxGs7SPbmk4rSpotzzov7v95qWG97Oi2kN8kQRxrAAWUYYRvD
	GNgKTPwQqmpqes+CRKeI2eRsZegwDGgNDkHDKyBdXvuGAv/QmvGq3bEoz8/pvwjIed7XEpMw0qm
	sSzdmDNgOwGf/Xl9QiReKVAcYJGhZAxSm1qlFjy0lXA==
X-Received: by 2002:a1c:1981:: with SMTP id 123mr2922485wmz.88.1570023995243; 
	Wed, 02 Oct 2019 06:46:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx8qDYPL+VQO03VD6k1hrbeHasztg7iAYo7N7CmPWC4P/WVBb1+qFIK7XJ0Y9eQOY8+Wb3Orw==
X-Received: by 2002:a1c:1981:: with SMTP id 123mr2922450wmz.88.1570023994911; 
	Wed, 02 Oct 2019 06:46:34 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b903:6d6f:a447:e464?
	([2001:b07:6468:f312:b903:6d6f:a447:e464])
	by smtp.gmail.com with ESMTPSA id
	z1sm38078286wre.40.2019.10.02.06.46.32
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 02 Oct 2019 06:46:33 -0700 (PDT)
Subject: Re: DANGER WILL ROBINSON, DANGER
To: Jerome Glisse <jglisse@redhat.com>,
	Mircea CIRJALIU - MELIU <mcirjaliu@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-72-alazar@bitdefender.com>
	<20190809162444.GP5482@bombadil.infradead.org>
	<1565694095.D172a51.28640.@15f23d3a749365d981e968181cce585d2dcb3ffa>
	<20190815191929.GA9253@redhat.com> <20190815201630.GA25517@redhat.com>
	<VI1PR02MB398411CA9A56081FF4D1248EBBA40@VI1PR02MB3984.eurprd02.prod.outlook.com>
	<20190905180955.GA3251@redhat.com>
	<5b0966de-b690-fb7b-5a72-bc7906459168@redhat.com>
	<DB7PR02MB3979D1143909423F8767ACE2BBB60@DB7PR02MB3979.eurprd02.prod.outlook.com>
	<20191002192714.GA5020@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <ab461f02-e6cd-de0f-b6ce-0f5a95798eaa@redhat.com>
Date: Wed, 2 Oct 2019 15:46:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002192714.GA5020@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?Q?Samuel_Laur=c3=a9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	=?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>
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

T24gMDIvMTAvMTkgMjE6MjcsIEplcm9tZSBHbGlzc2Ugd3JvdGU6Cj4gT24gVHVlLCBTZXAgMTAs
IDIwMTkgYXQgMDc6NDk6NTFBTSArMDAwMCwgTWlyY2VhIENJUkpBTElVIC0gTUVMSVUgd3JvdGU6
Cj4+PiBPbiAwNS8wOS8xOSAyMDowOSwgSmVyb21lIEdsaXNzZSB3cm90ZToKPj4+PiBOb3Qgc3Vy
ZSBpIHVuZGVyc3RhbmQsIHlvdSBhcmUgc2F5aW5nIHRoYXQgdGhlIHNvbHV0aW9uIGkgb3V0bGlu
ZQo+Pj4+IGFib3ZlIGRvZXMgbm90IHdvcmsgPyBJZiBzbyB0aGVuIGkgdGhpbmsgeW91IGFyZSB3
cm9uZywgaW4gdGhlIGFib3ZlCj4+Pj4gc29sdXRpb24gdGhlIGltcG9ydGluZyBwcm9jZXNzIG1t
YXAgYSBkZXZpY2UgZmlsZSBhbmQgdGhlIHJlc3VsdGluZwo+Pj4+IHZtYSBpcyB0aGVuIHBvcHVs
YXRlZCB1c2luZyBpbnNlcnRfcGZuKCkgYW5kIGNvbnN0YW50bHkga2VlcAo+Pj4+IHN5bmNocm9u
aXplIHdpdGggdGhlIHRhcmdldCBwcm9jZXNzIHRocm91Z2ggbWlycm9yaW5nIHdoaWNoIG1lYW5z
IHRoYXQKPj4+PiB5b3UgbmV2ZXIgaGF2ZSB0byBsb29rIGF0IHRoZSBzdHJ1Y3QgcGFnZSAuLi4g
eW91IGNhbiBtaXJyb3IgYW55IGtpbmQKPj4+PiBvZiBtZW1vcnkgZnJvbSB0aGUgcmVtb3RlIHBy
b2Nlc3MuCj4+Pgo+Pj4gSWYgaW5zZXJ0X3BmbiBpbiB0dXJuIGNhbGxzIE1NVSBub3RpZmllcnMg
Zm9yIHRoZSB0YXJnZXQgVk1BICh3aGljaCB3b3VsZCBiZQo+Pj4gdGhlIEtWTSBNTVUgbm90aWZp
ZXIpLCB0aGVuIHRoYXQgd291bGQgd29yay4gIFRob3VnaCBJIGd1ZXNzIGl0IHdvdWxkIGJlCj4+
PiBwb3NzaWJsZSB0byBjYWxsIE1NVSBub3RpZmllciB1cGRhdGUgY2FsbGJhY2tzIGFyb3VuZCB0
aGUgY2FsbCB0byBpbnNlcnRfcGZuLgo+Pgo+PiBDYW4ndCBkbyB0aGF0Lgo+PiBGaXJzdCwgaW5z
ZXJ0X3BmbigpIHVzZXMgc2V0X3B0ZV9hdCgpIHdoaWNoIHdvbid0IHRyaWdnZXIgdGhlIE1NVSBu
b3RpZmllciBvbgo+PiB0aGUgdGFyZ2V0IFZNQS4gSXQncyBhbHNvIHN0YXRpYywgc28gSSdsbCBo
YXZlIHRvIGFjY2VzcyBpdCB0aHJ1IHZtZl9pbnNlcnRfcGZuKCkKPj4gb3Igdm1mX2luc2VydF9t
aXhlZCgpLgo+IAo+IFdoeSB3b3VsZCB5b3UgbmVlZCB0byB0YXJnZXQgbW11IG5vdGlmaWVyIG9u
IHRhcmdldCB2bWEgPwoKSWYgdGhlIG1hcHBpbmcgb2YgdGhlIHNvdXJjZSBWTUEgY2hhbmdlcywg
bWlycm9yaW5nIGNhbiB1cGRhdGUgdGhlCnRhcmdldCBWTUEgdmlhIGluc2VydF9wZm4uICBCdXQg
d2hhdCBlbnN1cmVzIHRoYXQgS1ZNJ3MgTU1VIG5vdGlmaWVyCmRpc21hbnRsZXMgaXRzIG93biBl
eGlzdGluZyBwYWdlIHRhYmxlcyAoc28gdGhhdCB0aGV5IGNhbiBiZSByZWNyZWF0ZWQKd2l0aCB0
aGUgbmV3IG1hcHBpbmcgZnJvbSB0aGUgc291cmNlIFZNQSk/CgpUaGFua3MsCgpQYW9sbwoKPiBZ
b3UgZG8gbm90IG5lZWQKPiB0aGF0LiBUaGUgd29ya2Zsb3cgaXM6Cj4gCj4gICAgIHVzZXJzcGFj
ZToKPiAgICAgICAgIHB0ciA9IG1tYXAoL2Rldi9rdm0tbWlycm9yaW5nLWRldmljZSwgdmlydHVh
bF9hZGRyZXNzZV9vZl90YXJnZXQpCj4gCj4gVGhlbiB3aGVuIHRoZSBtaXJyb3JpbmcgcHJvY2Vz
cyBhY2Nlc3MgcHRyIGl0IHRyaWdnZXJzIHBhZ2UgZmF1bHQgdGhhdAo+IGVuZHVwIGluIHRoZSB2
bV9vcGVyYXRpb25fc3RydWN0LT5mYXVsdCgpIHdoaWNoIGlzIGp1c3QgZG9pbmc6Cj4gCj4gICAg
IGtlcm5lbC1rdm0tbWlycm9yaW5nLWZ1bmN0aW9uOgo+ICAgICAgICAga3ZtX21pcnJvcl9wYWdl
X2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKSB7Cj4gICAgICAgICAgICAgc3RydWN0IGt2bV9t
aXJyb3Jfc3RydWN0ICprdm1tczsKPiAKPiAgICAgICAgICAgICBrdm1tcyA9IGt2bV9taXJyb3Jf
c3RydWN0X2Zyb21fZmlsZSh2bWYtPnZtYS0+dm1fZmlsZSk7Cj4gICAgICAgICAgICAgLi4uCj4g
ICAgICAgICBhZ2FpbjoKPiAgICAgICAgICAgICBobW1fcmFuZ2VfcmVnaXN0ZXIoJnJhbmdlKTsK
PiAgICAgICAgICAgICBobW1fcmFuZ2Vfc25hcHNob3QoJnJhbmdlKTsKPiAgICAgICAgICAgICB0
YWtlX2xvY2soa3ZtbXMtPnVwZGF0ZSk7Cj4gICAgICAgICAgICAgaWYgKCFobW1fcmFuZ2VfdmFs
aWQoJnJhbmdlKSkgewo+ICAgICAgICAgICAgICAgICB2bV9pbnNlcnRfcGZuKCk7Cj4gICAgICAg
ICAgICAgICAgIGRyb3BfbG9jayhrdm1tcy0+dXBkYXRlKTsKPiAgICAgICAgICAgICAgICAgaG1t
X3JhbmdlX3VucmVnaXN0ZXIoJnJhbmdlKTsKPiAgICAgICAgICAgICAgICAgcmV0dXJuIFZNX0ZB
VUxUX05PUEFHRTsKPiAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgZHJvcF9sb2NrKGt2bW1z
LT51cGRhdGUpOwo+ICAgICAgICAgICAgIGdvdG8gYWdhaW47Cj4gICAgICAgICB9Cj4gCj4gVGhl
IG5vdGlmaWVyIGNhbGxiYWNrOgo+ICAgICAgICAga3ZtbXNfbm90aWZpZXJfc3RhcnQoKSB7Cj4g
ICAgICAgICAgICAgdGFrZV9sb2NrKGt2bW1zLT51cGRhdGUpOwo+ICAgICAgICAgICAgIGNsZWFy
X3B0ZShzdGFydCwgZW5kKTsKPiAgICAgICAgICAgICBkcm9wX2xvY2soa3ZtbXMtPnVwZGF0ZSk7
Cj4gICAgICAgICB9Cj4gCj4+Cj4+IE91ciBtb2RlbCAodGhlIGltcG9ydGluZyBwcm9jZXNzIGlz
IGVuY2Fwc3VsYXRlZCBpbiBhbm90aGVyIFZNKSBmb3JjZXMgdXMKPj4gdG8gbWlycm9yIGNlcnRh
aW4gcGFnZXMgZnJvbSB0aGUgYW5vbiBWTUEgYmFja2luZyBvbmUgVk0ncyBzeXN0ZW0gUkFNIHRv
IAo+PiB0aGUgb3RoZXIgVk0ncyBhbm9uIFZNQS4gCj4gCj4gVGhlIG1pcnJvciBkb2VzIG5vdCBo
YXZlIHRvIGJlIGFuIGFub24gdm1hIGl0IGNhbiB2ZXJ5IHdlbGwgYmUgYQo+IGRldmljZSB2bWEg
aWUgbW1hcCBvZiBhIGRldmljZSBmaWxlLiBJIGRvIG5vdCBzZWUgYW55IHJlYXNvbnMgd2h5Cj4g
dGhlIG1pcnJvciBuZWVkIHRvIGJlIGFuIGFub24gdm1hLiBQbGVhc2UgZXhwbGFpbiB3aHkuCj4g
Cj4+Cj4+IFVzaW5nIHRoZSBmdW5jdGlvbnMgYWJvdmUgbWVhbnMgc2V0dGluZyBWTV9QRk5NQVB8
Vk1fTUlYRURNQVAgb24gCj4+IHRoZSB0YXJnZXQgYW5vbiBWTUEsIGJ1dCBJIGd1ZXNzIHRoaXMg
YnJlYWtzIHRoZSBWTUEuIElzIHRoaXMgcmVjb21tZW5kZWQ/Cj4gCj4gVGhlIG1pcnJvciB2bWEg
c2hvdWxkIG5vdCBiZSBhbiBhbm9uIHZtYS4KPiAKPj4KPj4gVGhlbiwgbWFwcGluZyBhbm9uIHBh
Z2VzIGZyb20gb25lIFZNQSB0byBhbm90aGVyIHdpdGhvdXQgZml4aW5nIHRoZSAKPj4gcmVmY291
bnQgYW5kIHRoZSBtYXBjb3VudCBicmVha3MgdGhlIGRhZW1vbnMgdGhhdCB0aGluayB0aGV5J3Jl
IHdvcmtpbmcgCj4+IG9uIGEgcHVyZSBhbm9uIFZNQSAoa2NvbXBhY3RkLCBraHVnZXBhZ2VkKS4K
PiAKPiBOb3RlIGhlcmUgdGhlIHRhcmdldCB2bWEgaWUgdGhlIG1pcnJvcmluZyBvbmUgaXMgYSBt
bWFwIG9mIGRldmljZSBmaWxlCj4gYW5kIHRodXMgaXMgc2tpcCBieSBhbGwgb2YgdGhlIGFib3Zl
IChrY29tcGFjdGQsIGtodWdlcGFnZWQsIC4uLikgaXQgaXMKPiBmdWxseSBpZ25vcmUgYnkgY29y
ZSBtbS4KPiAKPiBUaHVzIHlvdSBkbyBub3QgbmVlZCB0byBmaXggdGhlIHJlZmNvdW50IGluIGFu
eSB3YXkuIElmIGFueSBvZiB0aGUgY29yZQo+IG1tIHRyeSB0byByZWNsYWltIG1lbW9yeSBmcm9t
IHRoZSBvcmlnaW5hbCB2bWEgdGhlbiB5b3Ugd2lsbCBnZXQgbW11Cj4gbm90aWZpZXIgY2FsbGJh
Y2tzIGFuZCBhbGwgeW91IGhhdmUgdG8gZG8gaXMgY2xlYXIgdGhlIHBhZ2UgdGFibGUgb2YgeW91
cgo+IGRldmljZSB2bWEuCj4gCj4gSSBkaWQgZXhhY3RseSB0aGF0IGFzIGEgdG9vbHMgaW4gdGhl
IHBhc3QgYW5kIGl0IHdvcmtzIGp1c3QgZmluZSB3aXRoCj4gbm8gY2hhbmdlIHRvIGNvcmUgbW0g
d2hhdHNvZXZlci4KPiAKPiBDaGVlcnMsCj4gSsOpcsO0bWUKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
