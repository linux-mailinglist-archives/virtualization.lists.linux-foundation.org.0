Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4D71FC14
	for <lists.virtualization@lfdr.de>; Wed, 15 May 2019 23:07:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 120BAD85;
	Wed, 15 May 2019 21:07:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 64E0B265
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 21:07:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D181383A
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 21:07:36 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id n14so1425051otk.2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 15 May 2019 14:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zEAiaEFTDEo5AHTXNi1igG//m3yl73MYATUt/TyQM/s=;
	b=JldDYW+LTAR5BoMmvzt3GhFBKSNFCQljO95A7CQF8h7lezT59wkCmoZR8HlZNeo3ZX
	ACz18is11PqZLJkpbZTbPrVApVsXuwCwQzpumDKhMYUGYyeEKSs4shc89Funjj7rmnrR
	zPCblVOMVW4B/FdfDdDBm0eQtlDpcEoDreFJYHB2TrhXh9porw+VCF0gkgtOPIdPF4AY
	hPK/m0cAXNVhKubNUJt+B+Ge41ks183CJ7yggGXayFgFqQhy+nfr59BSRoNiAIUor77P
	UmqXqpMAHdjAUWsPGhNLbi9iUpZ9FsKZwds3Nd3zmasJxQ+15Rm38l4yGAgNrmpf7grH
	OFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zEAiaEFTDEo5AHTXNi1igG//m3yl73MYATUt/TyQM/s=;
	b=RP4qw5hblb9MuG4PjlmBkZv2BmpqZRtOC+D+yxnUFHy+vFN8aKIZrOSneUwIj+5jos
	YcT33EXZpo2B609a4GHdJlyt6lZf0P7fIMgAJjCKHuwjr+Ndft/4GXUS80dCyiwfwomF
	Elt5pL6QpjDuTM6fZnybSioMwlM3W+Cwmu1jGt4fVXBCGeblxzUl8wcPt6vHYW9zaFd0
	xt0+lDNjlFYcb0vs30G/bs9qRmCPRkah4wdNBMHdB91jv7ivLB+6snJzaKz3t+5NOirL
	SbWWuo4xagWWbZokAAWlfPDvqJdtJlepLHW1/9oU/7nr+nPSJX53lgOs8eUX51nZy8ek
	bnCw==
X-Gm-Message-State: APjAAAVuSSEF1i2KGN216toWySxBF1lqRv15c1oBuGo10bzQDiKg+u+F
	NTsxSUtK2G9ddWmYqkIITT6fLZygE4UvJqoDTilBmA==
X-Google-Smtp-Source: APXvYqyDA/EWUSXzmLh3QyRTwliJkHZQ726n1NRYV2Be3duzD6pV8jVLvRmpMo63mBrfvCQmmCONZIUwdUcOhHdo8aI=
X-Received: by 2002:a05:6830:14d3:: with SMTP id
	t19mr27993804otq.57.1557954454945; 
	Wed, 15 May 2019 14:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190514145422.16923-1-pagupta@redhat.com>
	<20190514145422.16923-2-pagupta@redhat.com>
In-Reply-To: <20190514145422.16923-2-pagupta@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 15 May 2019 14:07:23 -0700
Message-ID: <CAPcyv4gEr_zPJEQp3k89v2UXfHp9PQwnJXY+W99HwXfxpvua_w@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] libnvdimm: nd_region flush callback support
To: Pankaj Gupta <pagupta@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: cohuck@redhat.com, Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, david <david@fromorbit.com>,
	Qemu Developers <qemu-devel@nongnu.org>,
	virtualization@lists.linux-foundation.org,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Ross Zwisler <zwisler@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
	Dave Jiang <dave.jiang@intel.com>, jstaron@google.com,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal L Verma <vishal.l.verma@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>, jmoyer <jmoyer@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Len Brown <lenb@kernel.org>, Adam Borowski <kilobyte@angband.pl>,
	Rik van Riel <riel@surriel.com>, yuval shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, lcapitulino@redhat.com,
	Nitesh Narayan Lal <nilal@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Igor Mammedov <imammedo@redhat.com>
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

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgNzo1NSBBTSBQYW5rYWogR3VwdGEgPHBhZ3VwdGFAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIGFkZHMgZnVuY3Rpb25hbGl0eSB0byBwZXJm
b3JtIGZsdXNoIGZyb20gZ3Vlc3QKPiB0byBob3N0IG92ZXIgVklSVElPLiBXZSBhcmUgcmVnaXN0
ZXJpbmcgYSBjYWxsYmFjayBiYXNlZAo+IG9uICduZF9yZWdpb24nIHR5cGUuIHZpcnRpb19wbWVt
IGRyaXZlciByZXF1aXJlcyB0aGlzIHNwZWNpYWwKPiBmbHVzaCBmdW5jdGlvbi4gRm9yIHJlc3Qg
b2YgdGhlIHJlZ2lvbiB0eXBlcyB3ZSBhcmUgcmVnaXN0ZXJpbmcKPiBleGlzdGluZyBmbHVzaCBm
dW5jdGlvbi4gUmVwb3J0IGVycm9yIHJldHVybmVkIGJ5IGhvc3QgZnN5bmMKPiBmYWlsdXJlIHRv
IHVzZXJzcGFjZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBhbmthaiBHdXB0YSA8cGFndXB0YUByZWRo
YXQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2FjcGkvbmZpdC9jb3JlLmMgICAgIHwgIDQgKystLQo+
ICBkcml2ZXJzL252ZGltbS9jbGFpbS5jICAgICAgIHwgIDYgKysrKy0tCj4gIGRyaXZlcnMvbnZk
aW1tL25kLmggICAgICAgICAgfCAgMSArCj4gIGRyaXZlcnMvbnZkaW1tL3BtZW0uYyAgICAgICAg
fCAxMyArKysrKysrKy0tLS0tCj4gIGRyaXZlcnMvbnZkaW1tL3JlZ2lvbl9kZXZzLmMgfCAyNiAr
KysrKysrKysrKysrKysrKysrKysrKystLQo+ICBpbmNsdWRlL2xpbnV4L2xpYm52ZGltbS5oICAg
IHwgIDggKysrKysrKy0KPiAgNiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvbmZpdC9jb3JlLmMgYi9k
cml2ZXJzL2FjcGkvbmZpdC9jb3JlLmMKPiBpbmRleCA1YTM4OWE0ZjRmNjUuLjA4ZGRlNzZjZjQ1
OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkvbmZpdC9jb3JlLmMKPiArKysgYi9kcml2ZXJz
L2FjcGkvbmZpdC9jb3JlLmMKPiBAQCAtMjQzNCw3ICsyNDM0LDcgQEAgc3RhdGljIHZvaWQgd3Jp
dGVfYmxrX2N0bChzdHJ1Y3QgbmZpdF9ibGsgKm5maXRfYmxrLCB1bnNpZ25lZCBpbnQgYncsCj4g
ICAgICAgICAgICAgICAgIG9mZnNldCA9IHRvX2ludGVybGVhdmVfb2Zmc2V0KG9mZnNldCwgbW1p
byk7Cj4KPiAgICAgICAgIHdyaXRlcShjbWQsIG1taW8tPmFkZHIuYmFzZSArIG9mZnNldCk7Cj4g
LSAgICAgICBudmRpbW1fZmx1c2gobmZpdF9ibGstPm5kX3JlZ2lvbik7Cj4gKyAgICAgICBudmRp
bW1fZmx1c2gobmZpdF9ibGstPm5kX3JlZ2lvbiwgTlVMTCk7Cj4KPiAgICAgICAgIGlmIChuZml0
X2Jsay0+ZGltbV9mbGFncyAmIE5GSVRfQkxLX0RDUl9MQVRDSCkKPiAgICAgICAgICAgICAgICAg
cmVhZHEobW1pby0+YWRkci5iYXNlICsgb2Zmc2V0KTsKPiBAQCAtMjQ4Myw3ICsyNDgzLDcgQEAg
c3RhdGljIGludCBhY3BpX25maXRfYmxrX3NpbmdsZV9pbyhzdHJ1Y3QgbmZpdF9ibGsgKm5maXRf
YmxrLAo+ICAgICAgICAgfQo+Cj4gICAgICAgICBpZiAocncpCj4gLSAgICAgICAgICAgICAgIG52
ZGltbV9mbHVzaChuZml0X2Jsay0+bmRfcmVnaW9uKTsKPiArICAgICAgICAgICAgICAgbnZkaW1t
X2ZsdXNoKG5maXRfYmxrLT5uZF9yZWdpb24sIE5VTEwpOwo+Cj4gICAgICAgICByYyA9IHJlYWRf
YmxrX3N0YXQobmZpdF9ibGssIGxhbmUpID8gLUVJTyA6IDA7Cj4gICAgICAgICByZXR1cm4gcmM7
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZkaW1tL2NsYWltLmMgYi9kcml2ZXJzL252ZGltbS9j
bGFpbS5jCj4gaW5kZXggZmI2NjdiZjQ2OWM3Li4xMzUxMGJhZTFlNmYgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9udmRpbW0vY2xhaW0uYwo+ICsrKyBiL2RyaXZlcnMvbnZkaW1tL2NsYWltLmMKPiBA
QCAtMjYzLDcgKzI2Myw3IEBAIHN0YXRpYyBpbnQgbnNpb19yd19ieXRlcyhzdHJ1Y3QgbmRfbmFt
ZXNwYWNlX2NvbW1vbiAqbmRucywKPiAgICAgICAgIHN0cnVjdCBuZF9uYW1lc3BhY2VfaW8gKm5z
aW8gPSB0b19uZF9uYW1lc3BhY2VfaW8oJm5kbnMtPmRldik7Cj4gICAgICAgICB1bnNpZ25lZCBp
bnQgc3pfYWxpZ24gPSBBTElHTihzaXplICsgKG9mZnNldCAmICg1MTIgLSAxKSksIDUxMik7Cj4g
ICAgICAgICBzZWN0b3JfdCBzZWN0b3IgPSBvZmZzZXQgPj4gOTsKPiAtICAgICAgIGludCByYyA9
IDA7Cj4gKyAgICAgICBpbnQgcmMgPSAwLCByZXQgPSAwOwo+Cj4gICAgICAgICBpZiAodW5saWtl
bHkoIXNpemUpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiBAQCAtMzAxLDcgKzMwMSw5
IEBAIHN0YXRpYyBpbnQgbnNpb19yd19ieXRlcyhzdHJ1Y3QgbmRfbmFtZXNwYWNlX2NvbW1vbiAq
bmRucywKPiAgICAgICAgIH0KPgo+ICAgICAgICAgbWVtY3B5X2ZsdXNoY2FjaGUobnNpby0+YWRk
ciArIG9mZnNldCwgYnVmLCBzaXplKTsKPiAtICAgICAgIG52ZGltbV9mbHVzaCh0b19uZF9yZWdp
b24obmRucy0+ZGV2LnBhcmVudCkpOwo+ICsgICAgICAgcmV0ID0gbnZkaW1tX2ZsdXNoKHRvX25k
X3JlZ2lvbihuZG5zLT5kZXYucGFyZW50KSwgTlVMTCk7Cj4gKyAgICAgICBpZiAocmV0KQo+ICsg
ICAgICAgICAgICAgICByYyA9IHJldDsKPgo+ICAgICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbnZkaW1tL25kLmggYi9kcml2ZXJzL252ZGltbS9uZC5oCj4gaW5k
ZXggYTVhYzNiMjQwMjkzLi4wYzc0ZDI0MjhiZDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9udmRp
bW0vbmQuaAo+ICsrKyBiL2RyaXZlcnMvbnZkaW1tL25kLmgKPiBAQCAtMTU5LDYgKzE1OSw3IEBA
IHN0cnVjdCBuZF9yZWdpb24gewo+ICAgICAgICAgc3RydWN0IGJhZGJsb2NrcyBiYjsKPiAgICAg
ICAgIHN0cnVjdCBuZF9pbnRlcmxlYXZlX3NldCAqbmRfc2V0Owo+ICAgICAgICAgc3RydWN0IG5k
X3BlcmNwdV9sYW5lIF9fcGVyY3B1ICpsYW5lOwo+ICsgICAgICAgaW50ICgqZmx1c2gpKHN0cnVj
dCBuZF9yZWdpb24gKm5kX3JlZ2lvbiwgc3RydWN0IGJpbyAqYmlvKTsKClNvIHRoaXMgdHJpZ2dl
cnM6CgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9udmRpbW0vZTgyMC5jOjc6Ci4vaW5j
bHVkZS9saW51eC9saWJudmRpbW0uaDoxNDA6NTE6IHdhcm5pbmc6IOKAmHN0cnVjdCBiaW/igJkg
ZGVjbGFyZWQKaW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90IGJlIHZpc2libGUgb3V0c2lk
ZSBvZiB0aGlzIGRlZmluaXRpb24Kb3IgZGVjbGFyYXRpb24KICBpbnQgKCpmbHVzaCkoc3RydWN0
IG5kX3JlZ2lvbiAqbmRfcmVnaW9uLCBzdHJ1Y3QgYmlvICpiaW8pOwogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn4KSSB3YXMgYWxyZWFkeSBmZWVs
aW5nIHVuZWFzeSBhYm91dCB0cnlpbmcgdG8gc3F1ZWV6ZSB0aGlzIGludG8gdjUuMiwKYnV0IHRo
aXMgd2FybmluZyBhbmQgdGhlIGNvbnRpbnVlZCBkcmlwIG9mIGNvbW1lbnRzIGxlYWRzIG1lIHRv
CmNvbmNsdWRlIHRoYXQgdGhpcyBkcml2ZXIgd291bGQgZG8gd2VsbCB0byB3YWl0IG9uZSBtb3Jl
IGRldmVsb3BtZW50CmN5Y2xlLiBMZXRzIGNsb3NlIG91dCB0aGUgZmluYWwgZml4dXBzIGFuZCBs
ZXQgdGhpcyBkcml2ZXIgc29hayBpbgotbmV4dC4gVGhlbiBmb3IgdGhlIHY1LjMgY3ljbGUgSSds
bCByZWRvdWJsZSBteSBlZmZvcnRzIHRvd2FyZHMgdGhlCmdvYWwgb2YgY2xvc2luZyBwYXRjaCBh
Y2NlcHRhbmNlIGF0IHRoZSAtcmM2IC8gLXJjNyBkZXZlbG9wbWVudAptaWxlc3RvbmUuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
