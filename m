Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0B5C0283
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 11:39:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C266B92F;
	Fri, 27 Sep 2019 09:38:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B841C92F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 09:38:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 31AA08D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 09:38:52 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5892385363
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 09:38:51 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id g65so2016171qkf.19
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 02:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=rOyYIzrWrloVuAx5hnkD3TMrF9pqyzmvSZFIAM/YQU8=;
	b=pvO5UnbM8ZYkp5gr0psg89GkUlwfcP/Y4G5oAVoeVx5co1BfbI/40qmt7CHsWqZaoD
	5qX1VNvP614RhsIaeFtgcRQZk5lT5+GtK1SlFa3FmYNmx1SU5CvfF4udW6pYH+FdrzdX
	7IvbcaODs3MRRrd7Jla66oD/mu8/UTL1e4Du/Z+t3K2F/eC9WNJY6bm09kSAJT0fSb5h
	yzmiFnhJY624IcC36XY8/EGIwJh2D+A2G04TXmT42BKYkVBwJi9rDkKRNaQ1z08lVcwj
	fMBMpJwYDvaOfVVyHyw1SrkgTsUsfY3W52vtPRTRI+pumdUH54EriDSuqYx1OPdsry2K
	HgYA==
X-Gm-Message-State: APjAAAXQVacW4msN/VjWYINM8uWxW8rqLes8XlXx/wU+sh9TPZIQpi7H
	y6Ln9w+lfr9uhvcqhBKMWcTW4P05wIiUGFV6cCQg6JdfG2yzmmm+BqTrzCqjuRihxeLCqw2aihR
	5b/ZyJaA1hTq9tZKLv9ocYgzOyFwiFyjHYuhrFJr7uw==
X-Received: by 2002:aed:3103:: with SMTP id 3mr8714972qtg.76.1569577130707;
	Fri, 27 Sep 2019 02:38:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDAuQ+kbM+rJGoW2H1RVZjcIQD6eUhHWI3ZWKcC6lLqGWDoGXC17Lib69zzC7/v1aBiaTSYg==
X-Received: by 2002:aed:3103:: with SMTP id 3mr8714962qtg.76.1569577130523;
	Fri, 27 Sep 2019 02:38:50 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	u39sm2417906qtj.34.2019.09.27.02.38.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Sep 2019 02:38:49 -0700 (PDT)
Date: Fri, 27 Sep 2019 05:38:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vhost: introduce mdev based hardware backend
Message-ID: <20190927053829-mutt-send-email-mst@kernel.org>
References: <20190926045427.4973-1-tiwei.bie@intel.com>
	<1b4b8891-8c14-1c85-1d6a-2eed1c90bcde@redhat.com>
	<20190927045438.GA17152@___>
	<05ab395e-6677-e8c3-becf-57bc1529921f@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05ab395e-6677-e8c3-becf-57bc1529921f@redhat.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, zhihong.wang@intel.com,
	maxime.coquelin@redhat.com, virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, lingshan.zhu@intel.com
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

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDQ6NDc6NDNQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDE5LzkvMjcg5LiL5Y2IMTI6NTQsIFRpd2VpIEJpZSB3cm90ZToKPiA+IE9u
IEZyaSwgU2VwIDI3LCAyMDE5IGF0IDExOjQ2OjA2QU0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4gPiA+IE9uIDIwMTkvOS8yNiDkuIvljYgxMjo1NCwgVGl3ZWkgQmllIHdyb3RlOgo+ID4gPiA+
ICsKPiA+ID4gPiArc3RhdGljIGxvbmcgdmhvc3RfbWRldl9zdGFydChzdHJ1Y3Qgdmhvc3RfbWRl
diAqbSkKPiA+ID4gPiArewo+ID4gPiA+ICsJc3RydWN0IG1kZXZfZGV2aWNlICptZGV2ID0gbS0+
bWRldjsKPiA+ID4gPiArCWNvbnN0IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpvcHMg
PSBtZGV2X2dldF9kZXZfb3BzKG1kZXYpOwo+ID4gPiA+ICsJc3RydWN0IHZpcnRpb19tZGV2X2Nh
bGxiYWNrIGNiOwo+ID4gPiA+ICsJc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnE7Cj4gPiA+ID4g
KwlpbnQgaWR4Owo+ID4gPiA+ICsKPiA+ID4gPiArCW9wcy0+c2V0X2ZlYXR1cmVzKG1kZXYsIG0t
PmFja2VkX2ZlYXR1cmVzKTsKPiA+ID4gPiArCj4gPiA+ID4gKwltZGV2X2FkZF9zdGF0dXMobWRl
diwgVklSVElPX0NPTkZJR19TX0ZFQVRVUkVTX09LKTsKPiA+ID4gPiArCWlmICghKG1kZXZfZ2V0
X3N0YXR1cyhtZGV2KSAmIFZJUlRJT19DT05GSUdfU19GRUFUVVJFU19PSykpCj4gPiA+ID4gKwkJ
Z290byByZXNldDsKPiA+ID4gPiArCj4gPiA+ID4gKwlmb3IgKGlkeCA9IDA7IGlkeCA8IG0tPm52
cXM7IGlkeCsrKSB7Cj4gPiA+ID4gKwkJdnEgPSAmbS0+dnFzW2lkeF07Cj4gPiA+ID4gKwo+ID4g
PiA+ICsJCWlmICghdnEtPmRlc2MgfHwgIXZxLT5hdmFpbCB8fCAhdnEtPnVzZWQpCj4gPiA+ID4g
KwkJCWJyZWFrOwo+ID4gPiA+ICsKPiA+ID4gPiArCQlpZiAob3BzLT5zZXRfdnFfc3RhdGUobWRl
diwgaWR4LCB2cS0+bGFzdF9hdmFpbF9pZHgpKQo+ID4gPiA+ICsJCQlnb3RvIHJlc2V0Owo+ID4g
PiBJZiB3ZSBkbyBzZXRfdnFfc3RhdGUoKSBpbiBTRVRfVlJJTkdfQkFTRSwgd2Ugd29uJ3QgbmVl
ZCB0aGlzIHN0ZXAgaGVyZS4KPiA+IFllYWgsIEkgcGxhbiB0byBkbyBpdCBpbiB0aGUgbmV4dCB2
ZXJzaW9uLgo+ID4gCj4gPiA+ID4gKwo+ID4gPiA+ICsJCS8qCj4gPiA+ID4gKwkJICogSW4gdmhv
c3QtbWRldiwgdXNlcnNwYWNlIHNob3VsZCBwYXNzIHJpbmcgYWRkcmVzc2VzCj4gPiA+ID4gKwkJ
ICogaW4gZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzc2VzIHdoZW4gSU9NTVUgaXMgZGlzYWJsZWQgb3IK
PiA+ID4gPiArCQkgKiBJT1ZBcyB3aGVuIElPTU1VIGlzIGVuYWJsZWQuCj4gPiA+ID4gKwkJICov
Cj4gPiA+IEEgcXVlc3Rpb24gaGVyZSwgY29uc2lkZXIgd2UncmUgdXNpbmcgbm9pb21tdSBtb2Rl
LiBJZiBndWVzdCBwaHlzaWNhbAo+ID4gPiBhZGRyZXNzIGlzIHBhc3NlZCBoZXJlLCBob3cgY2Fu
IGEgZGV2aWNlIHVzZSB0aGF0Pwo+ID4gPiAKPiA+ID4gSSBiZWxpZXZlIHlvdSBtZWFudCAiaG9z
dCBwaHlzaWNhbCBhZGRyZXNzIiBoZXJlPyBBbmQgaXQgYWxzbyBoYXZlIHRoZQo+ID4gPiBpbXBs
aWNhdGlvbiB0aGF0IHRoZSBIUEEgc2hvdWxkIGJlIGNvbnRpbnVvdXMgKGUuZyB1c2luZyBodWdl
dGxiZnMpLgo+ID4gVGhlIGNvbW1lbnQgaXMgdGFsa2luZyBhYm91dCB0aGUgdmlydHVhbCBJT01N
VSAoaS5lLiBpb3RsYiBpbiB2aG9zdCkuCj4gPiBJdCBzaG91bGQgYmUgcmVwaHJhc2VkIHRvIGNv
dmVyIHRoZSBub2lvbW11IGNhc2UgYXMgd2VsbC4gVGhhbmtzIGZvcgo+ID4gc3BvdHRpbmcgdGhp
cy4KPiA+IAo+ID4gCj4gPiA+ID4gKwo+ID4gPiA+ICsJc3dpdGNoIChjbWQpIHsKPiA+ID4gPiAr
CWNhc2UgVkhPU1RfTURFVl9TRVRfU1RBVEU6Cj4gPiA+ID4gKwkJciA9IHZob3N0X3NldF9zdGF0
ZShtLCBhcmdwKTsKPiA+ID4gPiArCQlicmVhazsKPiA+ID4gPiArCWNhc2UgVkhPU1RfR0VUX0ZF
QVRVUkVTOgo+ID4gPiA+ICsJCXIgPSB2aG9zdF9nZXRfZmVhdHVyZXMobSwgYXJncCk7Cj4gPiA+
ID4gKwkJYnJlYWs7Cj4gPiA+ID4gKwljYXNlIFZIT1NUX1NFVF9GRUFUVVJFUzoKPiA+ID4gPiAr
CQlyID0gdmhvc3Rfc2V0X2ZlYXR1cmVzKG0sIGFyZ3ApOwo+ID4gPiA+ICsJCWJyZWFrOwo+ID4g
PiA+ICsJY2FzZSBWSE9TVF9HRVRfVlJJTkdfQkFTRToKPiA+ID4gPiArCQlyID0gdmhvc3RfZ2V0
X3ZyaW5nX2Jhc2UobSwgYXJncCk7Cj4gPiA+ID4gKwkJYnJlYWs7Cj4gPiA+IERvZXMgaXQgbWVh
biB0aGUgU0VUX1ZSSU5HX0JBU0UgbWF5IG9ubHkgdGFrZSBhZmZlY3QgYWZ0ZXIKPiA+ID4gVkhP
U1RfTUVWX1NFVF9TVEFURT8KPiA+IFllYWgsIGluIHRoaXMgdmVyc2lvbiwgU0VUX1ZSSU5HX0JB
U0Ugd29uJ3Qgc2V0IHRoZSBiYXNlIHRvIHRoZQo+ID4gZGV2aWNlIGRpcmVjdGx5LiBCdXQgSSBw
bGFuIHRvIG5vdCBkZWxheSB0aGlzIGFueW1vcmUgaW4gdGhlIG5leHQKPiA+IHZlcnNpb24gdG8g
c3VwcG9ydCB0aGUgU0VUX1NUQVRVUy4KPiA+IAo+ID4gPiA+ICsJZGVmYXVsdDoKPiA+ID4gPiAr
CQlyID0gdmhvc3RfZGV2X2lvY3RsKCZtLT5kZXYsIGNtZCwgYXJncCk7Cj4gPiA+ID4gKwkJaWYg
KHIgPT0gLUVOT0lPQ1RMQ01EKQo+ID4gPiA+ICsJCQlyID0gdmhvc3RfdnJpbmdfaW9jdGwoJm0t
PmRldiwgY21kLCBhcmdwKTsKPiA+ID4gPiArCX0KPiA+ID4gPiArCj4gPiA+ID4gKwltdXRleF91
bmxvY2soJm0tPm11dGV4KTsKPiA+ID4gPiArCXJldHVybiByOwo+ID4gPiA+ICt9Cj4gPiA+ID4g
Kwo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHZmaW9fZGV2aWNlX29wcyB2ZmlvX3Zob3N0
X21kZXZfZGV2X29wcyA9IHsKPiA+ID4gPiArCS5uYW1lCQk9ICJ2ZmlvLXZob3N0LW1kZXYiLAo+
ID4gPiA+ICsJLm9wZW4JCT0gdmhvc3RfbWRldl9vcGVuLAo+ID4gPiA+ICsJLnJlbGVhc2UJPSB2
aG9zdF9tZGV2X3JlbGVhc2UsCj4gPiA+ID4gKwkuaW9jdGwJCT0gdmhvc3RfbWRldl91bmxvY2tl
ZF9pb2N0bCwKPiA+ID4gPiArfTsKPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBpbnQgdmhvc3Rf
bWRldl9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gPiA+ID4gK3sKPiA+ID4gPiArCXN0cnVj
dCBtZGV2X2RldmljZSAqbWRldiA9IG1kZXZfZnJvbV9kZXYoZGV2KTsKPiA+ID4gPiArCWNvbnN0
IHN0cnVjdCB2aXJ0aW9fbWRldl9kZXZpY2Vfb3BzICpvcHMgPSBtZGV2X2dldF9kZXZfb3BzKG1k
ZXYpOwo+ID4gPiA+ICsJc3RydWN0IHZob3N0X21kZXYgKm07Cj4gPiA+ID4gKwlpbnQgbnZxcywg
cjsKPiA+ID4gPiArCj4gPiA+ID4gKwltID0ga3phbGxvYyhzaXplb2YoKm0pLCBHRlBfS0VSTkVM
IHwgX19HRlBfUkVUUllfTUFZRkFJTCk7Cj4gPiA+ID4gKwlpZiAoIW0pCj4gPiA+ID4gKwkJcmV0
dXJuIC1FTk9NRU07Cj4gPiA+ID4gKwo+ID4gPiA+ICsJbXV0ZXhfaW5pdCgmbS0+bXV0ZXgpOwo+
ID4gPiA+ICsKPiA+ID4gPiArCW52cXMgPSBvcHMtPmdldF9xdWV1ZV9tYXgobWRldik7Cj4gPiA+
ID4gKwltLT5udnFzID0gbnZxczsKPiA+ID4gVGhlIG5hbWUgY291bGQgYmUgY29uZnVzaW5nLCBn
ZXRfcXVldWVfbWF4KCkgaXMgdG8gZ2V0IHRoZSBtYXhpbXVtIG51bWJlciBvZgo+ID4gPiBlbnRy
aWVzIGZvciBhIHZpcnRxdWV1ZSBzdXBwb3J0ZWQgYnkgdGhpcyBkZXZpY2UuCj4gPiBPSy4gSXQg
bWlnaHQgYmUgYmV0dGVyIHRvIHJlbmFtZSBpdCB0byBzb21ldGhpbmcgbGlrZToKPiA+IAo+ID4g
CWdldF92cV9udW1fbWF4KCkKPiA+IAo+ID4gd2hpY2ggaXMgbW9yZSBjb25zaXN0ZW50IHdpdGgg
dGhlIHNldF92cV9udW0oKS4KPiA+IAo+ID4gPiBJdCBsb29rcyB0byBtZSB0aGF0IHdlIG5lZWQg
YW5vdGhlciBBUEkgdG8gcXVlcnkgdGhlIG1heGltdW0gbnVtYmVyIG9mCj4gPiA+IHZpcnRxdWV1
ZXMgc3VwcG9ydGVkIGJ5IHRoZSBkZXZpY2UuCj4gPiBZZWFoLgo+ID4gCj4gPiBUaGFua3MsCj4g
PiBUaXdlaQo+IAo+IAo+IE9uZSBwcm9ibGVtIGhlcmU6Cj4gCj4gQ29uc2lkZXIgaWYgd2Ugd2Fu
dCB0byBzdXBwb3J0IG11bHRpcXVldWUsIGhvdyBkaWQgdXNlcnNwYWNlIGtub3cgYWJvdXQKPiB0
aGlzPwoKVGhlcmUncyBhIGZlYXR1cmUgYml0IGZvciB0aGlzLCBpc24ndCB0aGVyZT8KCj4gTm90
ZSB0aGlzIGluZm9ybWF0aW9uIGNvdWxkIGJlIGZldGNoZWQgZnJvbSBnZXRfY29uZmlnKCkgdmlh
IGEgZGV2aWNlCj4gc3BlY2lmaWMgd2F5LCBkbyB3ZSB3YW50IGlvY3RsIGZvciBhY2Nlc3Npbmcg
dGhhdCBhcmVhPwo+IAo+IFRoYW5rcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
