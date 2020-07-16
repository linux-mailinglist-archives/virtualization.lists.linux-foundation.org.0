Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A849A222E20
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 23:46:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E057883BF;
	Thu, 16 Jul 2020 21:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jwxgt06trWpN; Thu, 16 Jul 2020 21:46:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AC19D882FC;
	Thu, 16 Jul 2020 21:46:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90596C0733;
	Thu, 16 Jul 2020 21:46:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7D83C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 21:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE378882EB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 21:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkJoq04eEhUl
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 21:46:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E0D35882DE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 21:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594935983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BEo6DsOD3gtcpeqatc/jWU3HzAeT6ubK4oUjqlbQ034=;
 b=ZzYdJTqBcoRbBkP7QZdrktSO39GYoDQ1TTyaKvhVA7nF0B2KGthyCG/tUqVHB/1N7zJwqs
 kSJ02ArN2cQbk1lFf6gvM9wxQnJ4u+wQAeTSpisbYPa9I8/8i7QwH5PXWBFXBjOvz0DLp3
 4vdFmWTOazjnKe6EpGoKegSOw0Y+b5U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-yHW4ElKeM8asgp6DlcX-PA-1; Thu, 16 Jul 2020 17:46:21 -0400
X-MC-Unique: yHW4ElKeM8asgp6DlcX-PA-1
Received: by mail-wr1-f72.google.com with SMTP id i14so6258864wru.17
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 14:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BEo6DsOD3gtcpeqatc/jWU3HzAeT6ubK4oUjqlbQ034=;
 b=fjmHTU1dUhIXDC9rzot8HvB1mkEqnyD50AJOWmtmTu7VHeeQRHhsAjauMi7xKtZEUx
 NaUpruybN1KK8RshKPXi/YCfaVDXg5DihuNnNY7sK/LSOGjnpg7l6/Pfz8fRap3AhBKZ
 jMZeoXxR7phCccQYPGCWxoylgm0bJWyJcfQnc6mvcD9mAHUfBAQ6UAVjzVVe/3l+W35V
 t8dCuKah72+0zr0EpVd5kH0tjmLVq/BS3GhEigoX60FkbRd1gJao3wJOSjR840xv9oyG
 5+DXQAwFWORMprAoj7ywdmfcJFbUhS3KzfSCEjSd77RYOTLGIGJeTGHu83YbusYPEz5y
 Qcig==
X-Gm-Message-State: AOAM5326wGigFaoQR0ZjPmmdAAlLjEF1MEIXnUCyXgirvQP7qMs+1yMS
 NTt9yDEcWf+1g9dD0iOEpAEoE2C1O61D4U2OIUooFg/BxdGsVi3FGEUbKoid7kL5hydyrn7Kdfj
 2hePk6ZOm/4bwPGFazr1qm/NlTcnZqFbd90IdxVhTHw==
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr5994133wma.24.1594935980614;
 Thu, 16 Jul 2020 14:46:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykF2SVrQjmKDsKZhICrs30JZzeJmmbjM8l48AsSy4p8sKCLYwCNUjd1Gwxnb6QBEg+LM58nw==
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr5994113wma.24.1594935980304;
 Thu, 16 Jul 2020 14:46:20 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 k4sm10900176wrp.86.2020.07.16.14.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 14:46:19 -0700 (PDT)
Date: Thu, 16 Jul 2020 17:46:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Subject: Re: [PATCH v7 2/2] s390: virtio: PV needs VIRTIO I/O device protection
Message-ID: <20200716174603-mutt-send-email-mst@kernel.org>
References: <1594801869-13365-1-git-send-email-pmorel@linux.ibm.com>
 <1594801869-13365-3-git-send-email-pmorel@linux.ibm.com>
 <20200715054807-mutt-send-email-mst@kernel.org>
 <bc5e09ad-faaf-8b38-83e0-5f4a4b1daeb0@redhat.com>
 <20200715074917-mutt-send-email-mst@kernel.org>
 <3782338a-6491-dc35-7c66-97b91a20df0d@de.ibm.com>
MIME-Version: 1.0
In-Reply-To: <3782338a-6491-dc35-7c66-97b91a20df0d@de.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 Pierre Morel <pmorel@linux.ibm.com>, thomas.lendacky@amd.com,
 cohuck@redhat.com, linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 kvm@vger.kernel.org, hca@linux.ibm.com, david@gibson.dropbear.id.au
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVGh1LCBKdWwgMTYsIDIwMjAgYXQgMDE6MTk6NTVQTSArMDIwMCwgQ2hyaXN0aWFuIEJvcm50
cmFlZ2VyIHdyb3RlOgo+IAo+IAo+IE9uIDE1LjA3LjIwIDEzOjUxLCBNaWNoYWVsIFMuIFRzaXJr
aW4gd3JvdGU6Cj4gPiBPbiBXZWQsIEp1bCAxNSwgMjAyMCBhdCAwNjoxNjo1OVBNICswODAwLCBK
YXNvbiBXYW5nIHdyb3RlOgo+ID4+Cj4gPj4gT24gMjAyMC83LzE1IOS4i+WNiDU6NTAsIE1pY2hh
ZWwgUy4gVHNpcmtpbiB3cm90ZToKPiA+Pj4gT24gV2VkLCBKdWwgMTUsIDIwMjAgYXQgMTA6MzE6
MDlBTSArMDIwMCwgUGllcnJlIE1vcmVsIHdyb3RlOgo+ID4+Pj4gSWYgcHJvdGVjdGVkIHZpcnR1
YWxpemF0aW9uIGlzIGFjdGl2ZSBvbiBzMzkwLCB0aGUgdmlydGlvIHF1ZXVlcyBhcmUKPiA+Pj4+
IG5vdCBhY2Nlc3NpYmxlIHRvIHRoZSBob3N0LCB1bmxlc3MgVklSVElPX0ZfSU9NTVVfUExBVEZP
Uk0gaGFzIGJlZW4KPiA+Pj4+IG5lZ290aWF0ZWQuIFVzZSB0aGUgbmV3IGFyY2hfdmFsaWRhdGVf
dmlydGlvX2ZlYXR1cmVzKCkgaW50ZXJmYWNlIHRvCj4gPj4+PiBmYWlsIHByb2JlIGlmIHRoYXQn
cyBub3QgdGhlIGNhc2UsIHByZXZlbnRpbmcgYSBob3N0IGVycm9yIG9uIGFjY2Vzcwo+ID4+Pj4g
YXR0ZW1wdC4KPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmUgTW9yZWwgPHBtb3Jl
bEBsaW51eC5pYm0uY29tPgo+ID4+Pj4gUmV2aWV3ZWQtYnk6IENvcm5lbGlhIEh1Y2sgPGNvaHVj
a0ByZWRoYXQuY29tPgo+ID4+Pj4gQWNrZWQtYnk6IEhhbGlsIFBhc2ljIDxwYXNpY0BsaW51eC5p
Ym0uY29tPgo+ID4+Pj4gQWNrZWQtYnk6IENocmlzdGlhbiBCb3JudHJhZWdlciA8Ym9ybnRyYWVn
ZXJAZGUuaWJtLmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gICBhcmNoL3MzOTAvbW0vaW5pdC5jIHwg
MjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+Pj4gICAxIGZpbGUgY2hhbmdlZCwg
MjggaW5zZXJ0aW9ucygrKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3MzOTAvbW0v
aW5pdC5jIGIvYXJjaC9zMzkwL21tL2luaXQuYwo+ID4+Pj4gaW5kZXggNmRjN2MzYjYwZWY2Li5k
MzlhZjY1NTRkNGYgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9hcmNoL3MzOTAvbW0vaW5pdC5jCj4gPj4+
PiArKysgYi9hcmNoL3MzOTAvbW0vaW5pdC5jCj4gPj4+PiBAQCAtNDUsNiArNDUsNyBAQAo+ID4+
Pj4gICAjaW5jbHVkZSA8YXNtL2thc2FuLmg+Cj4gPj4+PiAgICNpbmNsdWRlIDxhc20vZG1hLW1h
cHBpbmcuaD4KPiA+Pj4+ICAgI2luY2x1ZGUgPGFzbS91di5oPgo+ID4+Pj4gKyNpbmNsdWRlIDxs
aW51eC92aXJ0aW9fY29uZmlnLmg+Cj4gPj4+PiAgIHBnZF90IHN3YXBwZXJfcGdfZGlyW1BUUlNf
UEVSX1BHRF0gX19zZWN0aW9uKC5ic3MuLnN3YXBwZXJfcGdfZGlyKTsKPiA+Pj4+IEBAIC0xNjEs
NiArMTYyLDMzIEBAIGJvb2wgZm9yY2VfZG1hX3VuZW5jcnlwdGVkKHN0cnVjdCBkZXZpY2UgKmRl
dikKPiA+Pj4+ICAgCXJldHVybiBpc19wcm90X3ZpcnRfZ3Vlc3QoKTsKPiA+Pj4+ICAgfQo+ID4+
Pj4gKy8qCj4gPj4+PiArICogYXJjaF92YWxpZGF0ZV92aXJ0aW9fZmVhdHVyZXMKPiA+Pj4+ICsg
KiBAZGV2OiB0aGUgVklSVElPIGRldmljZSBiZWluZyBhZGRlZAo+ID4+Pj4gKyAqCj4gPj4+PiAr
ICogUmV0dXJuIGFuIGVycm9yIGlmIHJlcXVpcmVkIGZlYXR1cmVzIGFyZSBtaXNzaW5nIG9uIGEg
Z3Vlc3QgcnVubmluZwo+ID4+Pj4gKyAqIHdpdGggcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uLgo+
ID4+Pj4gKyAqLwo+ID4+Pj4gK2ludCBhcmNoX3ZhbGlkYXRlX3ZpcnRpb19mZWF0dXJlcyhzdHJ1
Y3QgdmlydGlvX2RldmljZSAqZGV2KQo+ID4+Pj4gK3sKPiA+Pj4+ICsJaWYgKCFpc19wcm90X3Zp
cnRfZ3Vlc3QoKSkKPiA+Pj4+ICsJCXJldHVybiAwOwo+ID4+Pj4gKwo+ID4+Pj4gKwlpZiAoIXZp
cnRpb19oYXNfZmVhdHVyZShkZXYsIFZJUlRJT19GX1ZFUlNJT05fMSkpIHsKPiA+Pj4+ICsJCWRl
dl93YXJuKCZkZXYtPmRldiwKPiA+Pj4+ICsJCQkgImxlZ2FjeSB2aXJ0aW8gbm90IHN1cHBvcnRl
ZCB3aXRoIHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvblxuIik7Cj4gPj4+PiArCQlyZXR1cm4gLUVO
T0RFVjsKPiA+Pj4+ICsJfQo+ID4+Pj4gKwo+ID4+Pj4gKwlpZiAoIXZpcnRpb19oYXNfZmVhdHVy
ZShkZXYsIFZJUlRJT19GX0lPTU1VX1BMQVRGT1JNKSkgewo+ID4+Pj4gKwkJZGV2X3dhcm4oJmRl
di0+ZGV2LAo+ID4+Pj4gKwkJCSAic3VwcG9ydCBmb3IgbGltaXRlZCBtZW1vcnkgYWNjZXNzIHJl
cXVpcmVkIGZvciBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb25cbiIpOwo+ID4+Pj4gKwkJcmV0dXJu
IC1FTk9ERVY7Cj4gPj4+PiArCX0KPiA+Pj4+ICsKPiA+Pj4+ICsJcmV0dXJuIDA7Cj4gPj4+PiAr
fQo+ID4+Pj4gKwo+ID4+Pj4gICAvKiBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb24gKi8KPiA+Pj4+
ICAgc3RhdGljIHZvaWQgcHZfaW5pdCh2b2lkKQo+ID4+Pj4gICB7Cj4gPj4+IFdoYXQgYm90aGVy
cyBtZSBoZXJlIGlzIHRoYXQgYXJjaCBjb2RlIGRlcGVuZHMgb24gdmlydGlvIG5vdy4KPiA+Pj4g
SXQgd29ya3MgZXZlbiB3aXRoIGEgbW9kdWxhciB2aXJ0aW8gd2hlbiBmdW5jdGlvbnMgYXJlIGlu
bGluZSwKPiA+Pj4gYnV0IGl0IHNlZW1zIGZyYWdpbGU6IGUuZy4gaXQgYnJlYWtzIHZpcnRpbyBh
cyBhbiBvdXQgb2YgdHJlZSBtb2R1bGUsCj4gPj4+IHNpbmNlIGxheW91dCBvZiBzdHJ1Y3Qgdmly
dGlvX2RldmljZSBjYW4gY2hhbmdlLgo+ID4+Cj4gCj4gSWYgeW91IHByZWZlciB0aGF0LCB3ZSBj
YW4gc2ltcGx5IGNyZWF0ZSBhbiBhcmNoL3MzOTAva2VybmVsL3ZpcnRpby5jID8KCkhvdyB3b3Vs
ZCB0aGF0IGFkZHJlc3MgdGhlIGlzc3VlcyBhYm92ZT8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
