Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7001BC456
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 18:01:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3B6B788251;
	Tue, 28 Apr 2020 16:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2cfiaMryPE2o; Tue, 28 Apr 2020 16:01:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2958C87FEA;
	Tue, 28 Apr 2020 16:01:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1AF2FC0172;
	Tue, 28 Apr 2020 16:01:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E42E4C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D5DB085BEE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aItFiCtg--g
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:01:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DC511854C9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588089659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V/nHrnAWjFYDEx+ooars7FfriVR6n5mahvVNAOlPkCA=;
 b=T+G7JyE7CA49AvV1biNb5AOP7jqobjGb6AaCtB9L2E0TEjhJtICZrd7K2CFC9KsYP4XQsd
 LvrdLNDO2O2Jh5vql2rEZMKtUwoDi0lxa7DWHMBYLDvKX3cKe/y+yp8Ukl7x+UCsFoguv2
 XA3iPctyvNr8gPlnfUNOvyhTDOuzHbc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-t8P4sqWhM6e3pk4lL5EqXw-1; Tue, 28 Apr 2020 12:00:58 -0400
X-MC-Unique: t8P4sqWhM6e3pk4lL5EqXw-1
Received: by mail-wm1-f71.google.com with SMTP id f81so1056316wmf.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 09:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=V/nHrnAWjFYDEx+ooars7FfriVR6n5mahvVNAOlPkCA=;
 b=oC9/DDIAQpGHUoaCwLNy4mgLwXSmWEttjpLaQW1t2/bCmtRorhl0cfZ6TyDaibuFyv
 Y28jThlnOU9l5cak69Q+5i6a0JSB6gMMdLMxior/oUzNE/oLeY8r6lFI+CMVgERe5Epk
 oa/hDJzEjo/JFR9r1ZCqNc4ExebjaIkYC4vRYEck6Sl6qZNz5Xc3JiLnEF/tcJ15JHiP
 1h/5fX8R986wXa+/AJaFwlhT2Qmq52dm2Keo+GPSQz88NLXT0CpHXbZosvAc9LdZlW6x
 mhyC9GF3+MeKTHG7+ktlfFyftiZxFXIqU1pRmzh+Qe81HKASVfTfO7WJ92d+wvghlgAi
 QF4w==
X-Gm-Message-State: AGi0PuZ146EPFFKQFrgMOM3jCtJgdl8KFuXMqy8C1zG0K5pa3+tf9IJm
 90TMUYLo+Mdrc94pF6Hta+XicmOhxBZRA08c36bITcaxkSah29NzzeydggqxUA8ewwijpJI187R
 bFcKBa/JdlClOIoxfFeUd+Nq+q1uJG9RioLZ8pNF7MA==
X-Received: by 2002:adf:bb94:: with SMTP id q20mr36673129wrg.105.1588089656820; 
 Tue, 28 Apr 2020 09:00:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypKIbCy5WLfJsOD2H4tVuk3XU3G9si8HV/hIhC9ID521e8b71TD3eq8vjhdxcrAKzwjnXgEZ/g==
X-Received: by 2002:adf:bb94:: with SMTP id q20mr36673001wrg.105.1588089655649; 
 Tue, 28 Apr 2020 09:00:55 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id i129sm4064632wmi.20.2020.04.28.09.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 09:00:54 -0700 (PDT)
Date: Tue, 28 Apr 2020 18:00:52 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next 0/3] vsock: support network namespace
Message-ID: <20200428160052.o3ihui4262xogyg4@steredhat>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200427142518.uwssa6dtasrp3bfc@steredhat>
 <224cdc10-1532-7ddc-f113-676d43d8f322@redhat.com>
MIME-Version: 1.0
In-Reply-To: <224cdc10-1532-7ddc-f113-676d43d8f322@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, davem@davemloft.net,
 Jorgen Hansen <jhansen@vmware.com>
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

T24gVHVlLCBBcHIgMjgsIDIwMjAgYXQgMDQ6MTM6MjJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzQvMjcg5LiL5Y2IMTA6MjUsIFN0ZWZhbm8gR2FyemFyZWxsYSB3cm90
ZToKPiA+IEhpIERhdmlkLCBNaWNoYWVsLCBTdGVmYW4sCj4gPiBJJ20gcmVzdGFydGluZyB0byB3
b3JrIG9uIHRoaXMgdG9waWMgc2luY2UgS2F0YSBndXlzIGFyZSBpbnRlcmVzdGVkIHRvCj4gPiBo
YXZlIHRoYXQsIGVzcGVjaWFsbHkgb24gdGhlIGd1ZXN0IHNpZGUuCj4gPiAKPiA+IFdoaWxlIHdv
cmtpbmcgb24gdGhlIHYyIEkgaGFkIGZldyBkb3VidHMsIGFuZCBJJ2QgbGlrZSB0byBoYXZlIHlv
dXIKPiA+IHN1Z2dlc3Rpb25zOgo+ID4gCj4gPiAgIDEuIG5ldG5zIGFzc2lnbmVkIHRvIHRoZSBk
ZXZpY2UgaW5zaWRlIHRoZSBndWVzdAo+ID4gCj4gPiAgICAgQ3VycmVudGx5IEkgYXNzaWduZWQg
dGhpcyBkZXZpY2UgdG8gJ2luaXRfbmV0Jy4gTWF5YmUgaXQgaXMgYmV0dGVyCj4gPiAgICAgaWYg
d2UgYWxsb3cgdGhlIHVzZXIgdG8gZGVjaWRlIHdoaWNoIG5ldG5zIGFzc2lnbiB0byB0aGUgZGV2
aWNlCj4gPiAgICAgb3IgdG8gZGlzYWJsZSB0aGlzIG5ldyBmZWF0dXJlIHRvIGhhdmUgdGhlIHNh
bWUgYmVoYXZpb3IgYXMgYmVmb3JlCj4gPiAgICAgKGhvc3QgcmVhY2hhYmxlIGZyb20gYW55IG5l
dG5zKS4KPiA+ICAgICBJIHRoaW5rIHdlIGNhbiBoYW5kbGUgdGhpcyBpbiB0aGUgdnNvY2sgY29y
ZSBhbmQgbm90IGluIHRoZSBzaW5nbGUKPiA+ICAgICB0cmFuc3BvcnRzLgo+ID4gCj4gPiAgICAg
VGhlIHNpbXBsZXN0IHdheSB0aGF0IEkgZm91bmQsIGlzIHRvIGFkZCBhIG5ldwo+ID4gICAgIElP
Q1RMX1ZNX1NPQ0tFVFNfQVNTSUdOX0cySF9ORVROUyB0byAvZGV2L3Zzb2NrIHRvIGVuYWJsZSB0
aGUgZmVhdHVyZQo+ID4gICAgIGFuZCBhc3NpZ24gdGhlIGRldmljZSB0byB0aGUgc2FtZSBuZXRu
cyBvZiB0aGUgcHJvY2VzcyB0aGF0IGRvIHRoZQo+ID4gICAgIGlvY3RsKCksIGJ1dCBJJ20gbm90
IHN1cmUgaXQgaXMgY2xlYW4gZW5vdWdoLgo+ID4gCj4gPiAgICAgTWF5YmUgaXQgaXMgYmV0dGVy
IHRvIGFkZCBuZXcgcnRuZXRsaW5rIG1lc3NhZ2VzLCBidXQgSSdtIG5vdCBzdXJlIGlmCj4gPiAg
ICAgaXQgaXMgZmVhc2libGUgc2luY2Ugd2UgZG9uJ3QgaGF2ZSBhIG5ldGRldiBkZXZpY2UuCj4g
PiAKPiA+ICAgICBXaGF0IGRvIHlvdSBzdWdnZXN0Pwo+IAo+IAo+IEFzIHdlJ3ZlIGRpc2N1c3Nl
ZCwgaXQgc2hvdWxkIGJlIGEgbmV0ZGV2IHByb2JhYmx5IGluIGVpdGhlciBndWVzdCBvciBob3N0
Cj4gc2lkZS4gQW5kIGl0IHdvdWxkIGJlIG11Y2ggc2ltcGxlciBpZiB3ZSB3YW50IGRvIGltcGxl
bWVudCBuYW1lc3BhY2UgdGhlbi4KPiBObyBuZXcgQVBJIGlzIG5lZWRlZC4KPiAKClRoYW5rcyBK
YXNvbiEKCkl0IHdvdWxkIGJlIGNvb2wsIGJ1dCBJIGRvbid0IGhhdmUgbXVjaCBleHBlcmllbmNl
IG9uIG5ldGRldi4KRG8geW91IHNlZSBhbnkgcGFydGljdWxhciBvYnN0YWNsZXM/CgpJJ2xsIHRh
a2UgYSBsb29rIHRvIHVuZGVyc3RhbmQgaG93IHRvIGRvIGl0LCBzdXJlbHkgaW4gdGhlIGd1ZXN0
IHdvdWxkCmJlIHZlcnkgdXNlZnVsIHRvIGhhdmUgdGhlIHZzb2NrIGRldmljZSBhcyBhIG5ldGRl
diBhbmQgbWF5YmUgYWxzbyBpbiB0aGUgaG9zdC4KClN0ZWZhbm8KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
