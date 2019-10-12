Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B7D526D
	for <lists.virtualization@lfdr.de>; Sat, 12 Oct 2019 22:36:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 54C2B2101;
	Sat, 12 Oct 2019 20:35:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AFB6C20FD
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 20:27:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2A02114D
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 20:27:49 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0127888306
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 20:27:49 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id q9so5445157wmj.9
	for <virtualization@lists.linux-foundation.org>;
	Sat, 12 Oct 2019 13:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=EqTOWjC4L/Kz6sFQs9jCsgXd8dSNgdgkSYjDXmXjolo=;
	b=HwNzKGAGb0M2Zk4gr8Vr/2I+Gyk8fKojRvVKa43mMBx+PDu+9NmCmwCUlxZ7QZlJI/
	1pekc6V+2TwL4g9Mh0IjkDliOMEUQTSGKtCmYCkU0l0A3+VWyKzhmFYxQWp8Cj4tk0jn
	YqALWJjeXHlRuEmveTDMMrqA8QKxQOvbLm7FGReUyIAWeTyWOA7JifRvqc/JUSXMKK8e
	H9CVT0mxWxWe9kmzuAc+8iqRLRuXgb5AmYkoZKBJd9M+LMSYvFMNCXs9/c8Yvbn2o9dx
	SeQRdBwiBAQBHcrw0PB4rwwKmSiUuPiQZQtjcgSrTMiyvExbfRmQoQji7zVJMenVTsai
	kQWQ==
X-Gm-Message-State: APjAAAX93vOmeKV6P4XU4h+0kynnNca31Xi1nh/3IDRVC7AuGaRHBJXh
	1qrITiHvXjIIjjmthICxRGIc/j9XmsZjXK82PE8oW468frebaRfz/uHxioZE2Z6BCJQe/sdsCOC
	WRYo4IR0DtgzYFHUtBbOxvp1cLoA/1qB67HIg7AiTUg==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
	x8mr7778914wmj.123.1570912067636; 
	Sat, 12 Oct 2019 13:27:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwQzyMBrFDfWTdK5lUQ3sY5hHb4OoDfa1GaxOr1ruBpGf2toaNre0YJeRWwm2tOu4hgB0VNpQ==
X-Received: by 2002:a05:600c:21c8:: with SMTP id
	x8mr7778905wmj.123.1570912067370; 
	Sat, 12 Oct 2019 13:27:47 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	s9sm14550556wme.36.2019.10.12.13.27.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Oct 2019 13:27:46 -0700 (PDT)
Date: Sat, 12 Oct 2019 16:27:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC v1 1/2] vhost: option to fetch descriptors through an
	independent struct
Message-ID: <20191012162445-mutt-send-email-mst@kernel.org>
References: <20191011134358.16912-1-mst@redhat.com>
	<20191011134358.16912-2-mst@redhat.com>
	<3b2a6309-9d21-7172-a581-9f0f1d5c1427@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b2a6309-9d21-7172-a581-9f0f1d5c1427@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
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

T24gU2F0LCBPY3QgMTIsIDIwMTkgYXQgMDM6Mjg6NDlQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzEwLzExIOS4i+WNiDk6NDUsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90
ZToKPiA+IFRoZSBpZGVhIGlzIHRvIHN1cHBvcnQgbXVsdGlwbGUgcmluZyBmb3JtYXRzIGJ5IGNv
bnZlcnRpbmcKPiA+IHRvIGEgZm9ybWF0LWluZGVwZW5kZW50IGFycmF5IG9mIGRlc2NyaXB0b3Jz
Lgo+ID4gCj4gPiBUaGlzIGNvc3RzIGV4dHJhIGN5Y2xlcywgYnV0IHdlIGdhaW4gaW4gYWJpbGl0
eQo+ID4gdG8gZmV0Y2ggYSBiYXRjaCBvZiBkZXNjcmlwdG9ycyBpbiBvbmUgZ28sIHdoaWNoCj4g
PiBpcyBnb29kIGZvciBjb2RlIGNhY2hlIGxvY2FsaXR5Lgo+ID4gCj4gPiBUbyBzaW1wbGlmeSBi
ZW5jaG1hcmtpbmcsIEkga2VwdCB0aGUgb2xkIGNvZGUKPiA+IGFyb3VuZCBzbyBvbmUgY2FuIHN3
aXRjaCBiYWNrIGFuZCBmb3J0aCBieQo+ID4gd3JpdGluZyBpbnRvIGEgbW9kdWxlIHBhcmFtZXRl
ci4KPiA+IFRoaXMgd2lsbCBnbyBhd2F5IGluIHRoZSBmaW5hbCBzdWJtaXNzaW9uLgo+ID4gCj4g
PiBUaGlzIHBhdGNoIGNhdXNlcyBhIG1pbm9yIHBlcmZvcm1hbmNlIGRlZ3JhZGF0aW9uLAo+ID4g
aXQncyBiZWVuIGtlcHQgYXMgc2ltcGxlIGFzIHBvc3NpYmxlIGZvciBlYXNlIG9mIHJldmlldy4K
PiA+IE5leHQgcGF0Y2ggZ2V0cyB1cyBiYWNrIHRoZSBwZXJmb3JtYW5jZSBieSBhZGRpbmcgYmF0
Y2hpbmcuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJl
ZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy92aG9zdC90ZXN0LmMgIHwgIDE3ICsrLQo+
ID4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmMgfCAyOTkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystCj4gPiAgIGRyaXZlcnMvdmhvc3Qvdmhvc3QuaCB8ICAxNiArKysK
PiA+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzMjcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdGVzdC5jIGIvZHJpdmVycy92aG9z
dC90ZXN0LmMKPiA+IGluZGV4IDA1NjMwODAwODI4OC4uMzlhMDE4YTdhZjJkIDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy92aG9zdC90ZXN0LmMKPiA+ICsrKyBiL2RyaXZlcnMvdmhvc3QvdGVzdC5j
Cj4gPiBAQCAtMTgsNiArMTgsOSBAQAo+ID4gICAjaW5jbHVkZSAidGVzdC5oIgo+ID4gICAjaW5j
bHVkZSAidmhvc3QuaCIKPiA+ICtzdGF0aWMgaW50IG5ld2NvZGUgPSAwOwo+ID4gK21vZHVsZV9w
YXJhbShuZXdjb2RlLCBpbnQsIDA2NDQpOwo+ID4gKwo+ID4gICAvKiBNYXggbnVtYmVyIG9mIGJ5
dGVzIHRyYW5zZmVycmVkIGJlZm9yZSByZXF1ZXVlaW5nIHRoZSBqb2IuCj4gPiAgICAqIFVzaW5n
IHRoaXMgbGltaXQgcHJldmVudHMgb25lIHZpcnRxdWV1ZSBmcm9tIHN0YXJ2aW5nIG90aGVycy4g
Ki8KPiA+ICAgI2RlZmluZSBWSE9TVF9URVNUX1dFSUdIVCAweDgwMDAwCj4gPiBAQCAtNTgsMTAg
KzYxLDE2IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV92cShzdHJ1Y3Qgdmhvc3RfdGVzdCAqbikKPiA+
ICAgCXZob3N0X2Rpc2FibGVfbm90aWZ5KCZuLT5kZXYsIHZxKTsKPiA+ICAgCWZvciAoOzspIHsK
PiA+IC0JCWhlYWQgPSB2aG9zdF9nZXRfdnFfZGVzYyh2cSwgdnEtPmlvdiwKPiA+IC0JCQkJCSBB
UlJBWV9TSVpFKHZxLT5pb3YpLAo+ID4gLQkJCQkJICZvdXQsICZpbiwKPiA+IC0JCQkJCSBOVUxM
LCBOVUxMKTsKPiA+ICsJCWlmIChuZXdjb2RlKQo+ID4gKwkJCWhlYWQgPSB2aG9zdF9nZXRfdnFf
ZGVzY19iYXRjaCh2cSwgdnEtPmlvdiwKPiA+ICsJCQkJCQkgICAgICAgQVJSQVlfU0laRSh2cS0+
aW92KSwKPiA+ICsJCQkJCQkgICAgICAgJm91dCwgJmluLAo+ID4gKwkJCQkJCSAgICAgICBOVUxM
LCBOVUxMKTsKPiA+ICsJCWVsc2UKPiA+ICsJCQloZWFkID0gdmhvc3RfZ2V0X3ZxX2Rlc2ModnEs
IHZxLT5pb3YsCj4gPiArCQkJCQkJIEFSUkFZX1NJWkUodnEtPmlvdiksCj4gPiArCQkJCQkJICZv
dXQsICZpbiwKPiA+ICsJCQkJCQkgTlVMTCwgTlVMTCk7Cj4gPiAgIAkJLyogT24gZXJyb3IsIHN0
b3AgaGFuZGxpbmcgdW50aWwgdGhlIG5leHQga2ljay4gKi8KPiA+ICAgCQlpZiAodW5saWtlbHko
aGVhZCA8IDApKQo+ID4gICAJCQlicmVhazsKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0
L3Zob3N0LmMgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiA+IGluZGV4IDM2Y2EyY2Y0MTliZi4u
MzY2NjFkNmNiNTFmIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gPiAr
KysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiA+IEBAIC0zMDEsNiArMzAxLDcgQEAgc3RhdGlj
IHZvaWQgdmhvc3RfdnFfcmVzZXQoc3RydWN0IHZob3N0X2RldiAqZGV2LAo+ID4gICAJCQkgICBz
dHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKPiA+ICAgewo+ID4gICAJdnEtPm51bSA9IDE7Cj4g
PiArCXZxLT5uZGVzY3MgPSAwOwo+ID4gICAJdnEtPmRlc2MgPSBOVUxMOwo+ID4gICAJdnEtPmF2
YWlsID0gTlVMTDsKPiA+ICAgCXZxLT51c2VkID0gTlVMTDsKPiA+IEBAIC0zNjksNiArMzcwLDkg
QEAgc3RhdGljIGludCB2aG9zdF93b3JrZXIodm9pZCAqZGF0YSkKPiA+ICAgc3RhdGljIHZvaWQg
dmhvc3RfdnFfZnJlZV9pb3ZlY3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEpCj4gPiAgIHsK
PiA+ICsJa2ZyZWUodnEtPmRlc2NzKTsKPiA+ICsJdnEtPmRlc2NzID0gTlVMTDsKPiA+ICsJdnEt
Pm1heF9kZXNjcyA9IDA7Cj4gPiAgIAlrZnJlZSh2cS0+aW5kaXJlY3QpOwo+ID4gICAJdnEtPmlu
ZGlyZWN0ID0gTlVMTDsKPiA+ICAgCWtmcmVlKHZxLT5sb2cpOwo+ID4gQEAgLTM4NSw2ICszODks
MTAgQEAgc3RhdGljIGxvbmcgdmhvc3RfZGV2X2FsbG9jX2lvdmVjcyhzdHJ1Y3Qgdmhvc3RfZGV2
ICpkZXYpCj4gPiAgIAlmb3IgKGkgPSAwOyBpIDwgZGV2LT5udnFzOyArK2kpIHsKPiA+ICAgCQl2
cSA9IGRldi0+dnFzW2ldOwo+ID4gKwkJdnEtPm1heF9kZXNjcyA9IGRldi0+aW92X2xpbWl0Owo+
ID4gKwkJdnEtPmRlc2NzID0ga21hbGxvY19hcnJheSh2cS0+bWF4X2Rlc2NzLAo+ID4gKwkJCQkJ
ICBzaXplb2YoKnZxLT5kZXNjcyksCj4gPiArCQkJCQkgIEdGUF9LRVJORUwpOwo+IAo+IAo+IElz
IGlvdl9saW1pdCB0b28gbXVjaCBoZXJlPyBJdCBjYW4gb2J2aW91c2x5IGluY3JlYXNlIHRoZSBm
b290cHJpbnQuIEkgZ3Vlc3MKPiB0aGUgYmF0Y2hpbmcgY2FuIG9ubHkgYmUgZG9uZSBmb3IgZGVz
Y3JpcHRvciB3aXRob3V0IGluZGlyZWN0IG9yIG5leHQgc2V0Lgo+IFRoZW4gd2UgbWF5IGJhdGNo
IDE2IG9yIDY0Lgo+IAo+IFRoYW5rcwoKWWVzLCBuZXh0IHBhdGNoIG9ubHkgYmF0Y2hlcyB1cCB0
byA2NC4gIEJ1dCB3ZSBkbyBuZWVkIGlvdl9saW1pdCBiZWNhdXNlCmd1ZXN0IGNhbiBwYXNzIGEg
bG9uZyBjaGFpbiBvZiBzY2F0dGVyL2dhdGhlci4KV2UgYWxyZWFkeSBoYXZlIGlvdmVjcyBpbiBh
IGh1Z2UgYXJyYXkgc28gdGhpcyBkb2VzIG5vdCBsb29rIGxpa2UKYSBiaWcgZGVhbC4gSWYgd2Ug
ZXZlciB0ZWFjaCB0aGUgY29kZSB0byBhdm9pZCB0aGUgaHVnZQppb3YgYXJyYXlzIGJ5IGhhbmRs
aW5nIGh1Z2Ugcy9nIGxpc3RzIHBpZWNlIGJ5IHBpZWNlLAp3ZSBjYW4gbWFrZSB0aGUgZGVzYyBh
cnJheSBzbWFsbGVyIGF0IHRoZSBzYW1lIHBvaW50LgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
