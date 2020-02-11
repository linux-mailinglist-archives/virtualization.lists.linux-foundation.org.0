Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFCF158CCF
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 11:38:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 070758558A;
	Tue, 11 Feb 2020 10:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9nOptZor0o3; Tue, 11 Feb 2020 10:38:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6F1F685582;
	Tue, 11 Feb 2020 10:38:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CFFBC07FE;
	Tue, 11 Feb 2020 10:38:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34DB7C07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1EDA085552
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aMDgW7FHsLe9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:38:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 52B898367E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 10:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581417479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShA6gshvRnZ0GGC3w/T/LthefFbDChD5+kxR6pT+rSA=;
 b=FvsOpHgQvykawQYzxW8ZAtymrdluD9VbBNjeYpPIm3/KvHYv5Fld0sH0IFZC1UBl1F1Yeg
 cTDivHCvNEk8kjptxSoLriNj2NVOwkE5Z3mg2tH5Hy585cR9HncWvw6aj52LEpA4kH/VW6
 BT8ZLbhiJPox28F9hYARnoRMNKaZ784=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-xes8lEU9N-KVDDzK2M9wgA-1; Tue, 11 Feb 2020 05:37:56 -0500
Received: by mail-qk1-f197.google.com with SMTP id r142so3345177qke.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 02:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ShA6gshvRnZ0GGC3w/T/LthefFbDChD5+kxR6pT+rSA=;
 b=ceEbt1GSawBvEue8kqwueDXhMZh4GsbiQmZxMDN7Te8sKMNr5B4v+kwySJAsqJEH2R
 uyYRLcSasy/AxSmooIDc+d4p9cuR0HmKOaTuql2f0O6Eh9C6GHW/7l4ebnyMxKO/R7Q4
 rMCy1cspXIlqe3gnhIzj114cTyjSeytXA1AXSRID2qpmRV0s3B01sHRLXZjo/Ajr6UNZ
 LKwVnYB2G1a6oCcMlt+zKxiS7iRW8KSGgx7Dz9tF/aOQ0KiFd/QPSqYyOxOQPIByiigh
 9iC6afjVQXQXqtNFpYazLX+GDl6c+7NJrbdG9i7rDnd/dXj8roBDvxQThGdKDn9d+CQt
 LDgA==
X-Gm-Message-State: APjAAAWuHWms+7CGtYqneniBM3Qrk8vJ6FGhzDoLAsrvY7ruzirXe8M9
 o7K9DC1ONhtypI/kt0xAB50CVfVxwRC2omf1E/PEpIX1hAN+6Q5yVMAq8n7Efw/tpb4Yjh7FhjF
 gz6t5Gl2wY/QZ7mns8s7nh85fQcA8GqBVU6KPVUzsoA==
X-Received: by 2002:a0c:ea50:: with SMTP id u16mr14484816qvp.110.1581417475251; 
 Tue, 11 Feb 2020 02:37:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8CBMwITEeHUVRHIfIioI1sZv68eWt44VxQnsBgQVT6VXW8NhtMwPENj6EvZ4Ioukyy/gL1g==
X-Received: by 2002:a0c:ea50:: with SMTP id u16mr14484803qvp.110.1581417475041; 
 Tue, 11 Feb 2020 02:37:55 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id v55sm1987057qtc.1.2020.02.11.02.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 02:37:54 -0800 (PST)
Date: Tue, 11 Feb 2020 05:37:50 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
Message-ID: <20200211053502-mutt-send-email-mst@kernel.org>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
 <57230228-7030-c65f-a24f-910ca52bbe9e@cambridgegreys.com>
 <f78bfe6e-2ffc-3734-9618-470f1afea0c6@redhat.com>
 <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
MIME-Version: 1.0
In-Reply-To: <918222d9-816a-be70-f8af-b8dfcb586240@cambridgegreys.com>
X-MC-Unique: xes8lEU9N-KVDDzK2M9wgA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-um@lists.infradead.org,
 virtualization@lists.linux-foundation.org
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

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDc6NDI6MzdBTSArMDAwMCwgQW50b24gSXZhbm92IHdy
b3RlOgo+IE9uIDExLzAyLzIwMjAgMDI6NTEsIEphc29uIFdhbmcgd3JvdGU6Cj4gPiAKPiA+IE9u
IDIwMjAvMi8xMSDkuIrljYgxMjo1NSwgQW50b24gSXZhbm92IHdyb3RlOgo+ID4gPiAKPiA+ID4g
Cj4gPiA+IE9uIDA5LzEyLzIwMTkgMTA6NDgsIGFudG9uLml2YW5vdkBjYW1icmlkZ2VncmV5cy5j
b20gd3JvdGU6Cj4gPiA+ID4gRnJvbTogQW50b24gSXZhbm92IDxhbnRvbi5pdmFub3ZAY2FtYnJp
ZGdlZ3JleXMuY29tPgo+ID4gPiA+IAo+ID4gPiA+IFNvbWUgb2YgdGhlIGZyYW1lcyBtYXJrZWQg
YXMgR1NPIHdoaWNoIGFycml2ZSBhdAo+ID4gPiA+IHZpcnRpb19uZXRfaGRyX2Zyb21fc2tiKCkg
aGF2ZSBubyBHU09fVFlQRSwgbm8KPiA+ID4gPiBmcmFnbWVudHMgKGRhdGFfbGVuID0gMCkgYW5k
IGxlbmd0aCBzaWduaWZpY2FudGx5IHNob3J0ZXIKPiA+ID4gPiB0aGFuIHRoZSBNVFUgKDc1MiBp
biBteSBleHBlcmltZW50cykuCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBpcyBvYnNlcnZlZCBvbiBy
YXcgc29ja2V0cyByZWFkaW5nIG9mZiB2RXRoIGludGVyZmFjZXMKPiA+ID4gPiBpbiBhbGwgNC54
IGFuZCA1Lngga2VybmVscyBJIHRlc3RlZC4KPiA+ID4gPiAKPiA+ID4gPiBUaGVzZSBmcmFtZXMg
YXJlIHJlcG9ydGVkIGFzIGludmFsaWQgd2hpbGUgdGhleSBhcmUgaW4gZmFjdAo+ID4gPiA+IGdz
by1sZXNzIGZyYW1lcy4KPiA+ID4gPiAKPiA+ID4gPiBUaGlzIHBhdGNoIG1hcmtzIHRoZSB2bmV0
IGhlYWRlciBhcyBuby1HU08gZm9yIHRoZW0gaW5zdGVhZAo+ID4gPiA+IG9mIHJlcG9ydGluZyBp
dCBhcyBpbnZhbGlkLgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudG9uIEl2YW5v
diA8YW50b24uaXZhbm92QGNhbWJyaWRnZWdyZXlzLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiDC
oCBpbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaCB8IDggKysrKysrLS0KPiA+ID4gPiDCoCAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiA+IAo+ID4g
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaCBiL2luY2x1ZGUvbGlu
dXgvdmlydGlvX25ldC5oCj4gPiA+ID4gaW5kZXggMGQxZmU5Mjk3YWM2Li5kOTBkNWNmZjFiOWEg
MTAwNjQ0Cj4gPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC92aXJ0aW9fbmV0LmgKPiA+ID4gPiAr
KysgYi9pbmNsdWRlL2xpbnV4L3ZpcnRpb19uZXQuaAo+ID4gPiA+IEBAIC0xMTIsOCArMTEyLDEy
IEBAIHN0YXRpYyBpbmxpbmUgaW50Cj4gPiA+ID4gdmlydGlvX25ldF9oZHJfZnJvbV9za2IoY29u
c3Qgc3RydWN0IHNrX2J1ZmYgKnNrYiwKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBoZHItPmdzb190eXBlID0gVklSVElPX05FVF9IRFJfR1NPX1RDUFY0Owo+ID4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoCBlbHNlIGlmIChzaW5mby0+Z3NvX3R5cGUgJiBTS0JfR1NPX1RDUFY2KQo+
ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgPSBWSVJUSU9f
TkVUX0hEUl9HU09fVENQVjY7Cj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgIGVsc2UKPiA+ID4gPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqAgZWxzZSB7Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNrYi0+ZGF0
YV9sZW4gPT0gMCkKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+
Z3NvX3R5cGUgPSBWSVJUSU9fTkVUX0hEUl9HU09fTk9ORTsKPiA+ID4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlbHNlCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgfQo+ID4gPiA+IMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoc2luZm8tPmdzb190eXBlICYgU0tCX0dTT19UQ1BfRUNOKQo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGhkci0+Z3NvX3R5cGUgfD0gVklSVElPX05FVF9I
RFJfR1NPX0VDTjsKPiA+ID4gPiDCoMKgwqDCoMKgIH0gZWxzZQo+ID4gPiA+IAo+ID4gPiAKPiA+
ID4gcGluZy4KPiA+ID4gCj4gPiAKPiA+IERvIHlvdSBtZWFuIGdzb19zaXplIGlzIHNldCBidXQg
Z3NvX3R5cGUgaXMgbm90PyBMb29rcyBsaWtlIGEgYnVnCj4gPiBlbHNld2hlcmUuCj4gPiAKPiA+
IFRoYW5rcwo+ID4gCj4gPiAKPiBZZXMuCj4gCj4gSSBjb3VsZCBub3QgdHJhY2UgaXQgd2hlcmUg
aXQgaXMgY29taW5nIGZyb20uCj4gCj4gSSBzZWUgaXQgd2hlbiBkb2luZyByZWN2bW1zZyBvbiBy
YXcgc29ja2V0cyBpbiB0aGUgVU1MIHZlY3RvciBuZXR3b3JrCj4gZHJpdmVycy4KPiAKCkkgdGhp
bmsgd2UgbmVlZCB0byBmaW5kIHRoZSBjdWxwcml0IGFuZCBmaXggaXQgdGhlcmUsIGxvdHMgb2Yg
b3RoZXIgdGhpbmdzCmNhbiBicmVhayBvdGhlcndpc2UuCkp1c3QgcHJpbnRpbmcgb3V0IHNrYi0+
ZGV2LT5uYW1lIHNob3VsZCBkbyB0aGUgdHJpY2ssIG5vPwoKCj4gLS0gCj4gQW50b24gUi4gSXZh
bm92Cj4gQ2FtYnJpZGdlZ3JleXMgTGltaXRlZC4gUmVnaXN0ZXJlZCBpbiBFbmdsYW5kLiBDb21w
YW55IE51bWJlciAxMDI3MzY2MQo+IGh0dHBzOi8vd3d3LmNhbWJyaWRnZWdyZXlzLmNvbS8KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
