Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 446341F0B92
	for <lists.virtualization@lfdr.de>; Sun,  7 Jun 2020 15:59:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA9A98579E;
	Sun,  7 Jun 2020 13:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6_fE33fNjUS; Sun,  7 Jun 2020 13:59:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 457528574B;
	Sun,  7 Jun 2020 13:59:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 210E4C016F;
	Sun,  7 Jun 2020 13:59:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 877D4C016F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7E6A58164C
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:59:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHi55UqLY29C
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:59:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 466048078A
 for <virtualization@lists.linux-foundation.org>;
 Sun,  7 Jun 2020 13:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591538345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=49hQQxJz0ezLYVnWHq736mWDL47lS1M2M2KOpADI1+8=;
 b=dkUgyYM0Ml5IogJnzksC4sYhsrLJMRlftBkj1D4tdXz+N4OoIT/pDxVCDQy/LoC17AC4Mr
 ylIFkfmocHu+AQu5cbnh+IfETelrPgzAKLGfyR7eF1GamKfBbl2+Kn+nbLhd29c6p3imuf
 meDekaebhhPAPfVbuY8Z8A/QDzskBwA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-MlPwaqZMM5SX27EuAvTAxQ-1; Sun, 07 Jun 2020 09:59:04 -0400
X-MC-Unique: MlPwaqZMM5SX27EuAvTAxQ-1
Received: by mail-wm1-f69.google.com with SMTP id v24so798110wmh.3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 06:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=49hQQxJz0ezLYVnWHq736mWDL47lS1M2M2KOpADI1+8=;
 b=aJzNLet1XEx3PMP2xlUWeeau3/FImMRU4VJIZlUU4PabWAT//kw+SSmiGEzkvhztNy
 q51uvHKXRQz845bZf9zbh9pcnyN9EwoQQ3AD6WdTA+DACtPuaToITGTzHAjBFhJmERFY
 dAo7xX+QnDiyi0o+ZrBvcsD0s1xyZ2QyQI8C0OK3XNKV6E5mIPdBRDYaLe19W4eTOjFz
 8Vac4Ftfl9YzBfH7AG9gelFQ85bOYGeo7ROZ8nPRMXDEzM+LwJPToCDJS/ANoEmdJwHX
 l7wcJKSKkDYibodAjxOvLKzYl9sb/4nUWQns0SStt+Tso9F+coUWDRinVzr/ZmUpi0kU
 ZTXQ==
X-Gm-Message-State: AOAM531dX7YJynCbYE4T9HDqrqJgDnXqwbGMyHqPW/idIPQtXehMPQ/Y
 NBcgwE4tO3YGzz3+jJltSzhTsVXnvNfQ9D9+iG+RLJJ3xZpc0lZrdyWaUK2a9EIybq+ixCB+f9c
 e4/DxeE01HUQpj5DIEW4qMdJ33/8YTJCyEsXLz1uTRw==
X-Received: by 2002:a1c:7e52:: with SMTP id z79mr12393936wmc.104.1591538343138; 
 Sun, 07 Jun 2020 06:59:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPhCdg8nsVcYSKRsQtxYqjMu3Z2lGeq+GOYXsFNupGugKNhvKfrGs/gdkikgAZslAUpcg9tw==
X-Received: by 2002:a1c:7e52:: with SMTP id z79mr12393918wmc.104.1591538342920; 
 Sun, 07 Jun 2020 06:59:02 -0700 (PDT)
Received: from redhat.com (bzq-82-81-31-23.red.bezeqint.net. [82.81.31.23])
 by smtp.gmail.com with ESMTPSA id y37sm23372137wrd.55.2020.06.07.06.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 06:59:02 -0700 (PDT)
Date: Sun, 7 Jun 2020 09:59:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC 01/13] vhost: option to fetch descriptors through an
 independent struct
Message-ID: <20200607095810-mutt-send-email-mst@kernel.org>
References: <20200602130543.578420-1-mst@redhat.com>
 <20200602130543.578420-2-mst@redhat.com>
 <e35e5df9-7e36-227e-7981-232a62b06607@redhat.com>
 <20200603045825-mutt-send-email-mst@kernel.org>
 <48e6d644-c4aa-2754-9d06-22133987b3be@redhat.com>
MIME-Version: 1.0
In-Reply-To: <48e6d644-c4aa-2754-9d06-22133987b3be@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

T24gV2VkLCBKdW4gMDMsIDIwMjAgYXQgMDg6MDQ6NDVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzYvMyDkuIvljYg1OjQ4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6
Cj4gPiBPbiBXZWQsIEp1biAwMywgMjAyMCBhdCAwMzoxMzo1NlBNICswODAwLCBKYXNvbiBXYW5n
IHdyb3RlOgo+ID4gPiBPbiAyMDIwLzYvMiDkuIvljYg5OjA1LCBNaWNoYWVsIFMuIFRzaXJraW4g
d3JvdGU6Cj4gCj4gCj4gWy4uLl0KPiAKPiAKPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBpbnQg
ZmV0Y2hfaW5kaXJlY3RfZGVzY3Moc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCj4gPiA+ID4g
KwkJCQlzdHJ1Y3Qgdmhvc3RfZGVzYyAqaW5kaXJlY3QsCj4gPiA+ID4gKwkJCQl1MTYgaGVhZCkK
PiA+ID4gPiArewo+ID4gPiA+ICsJc3RydWN0IHZyaW5nX2Rlc2MgZGVzYzsKPiA+ID4gPiArCXVu
c2lnbmVkIGludCBpID0gMCwgY291bnQsIGZvdW5kID0gMDsKPiA+ID4gPiArCXUzMiBsZW4gPSBp
bmRpcmVjdC0+bGVuOwo+ID4gPiA+ICsJc3RydWN0IGlvdl9pdGVyIGZyb207Cj4gPiA+ID4gKwlp
bnQgcmV0Owo+ID4gPiA+ICsKPiA+ID4gPiArCS8qIFNhbml0eSBjaGVjayAqLwo+ID4gPiA+ICsJ
aWYgKHVubGlrZWx5KGxlbiAlIHNpemVvZiBkZXNjKSkgewo+ID4gPiA+ICsJCXZxX2Vycih2cSwg
IkludmFsaWQgbGVuZ3RoIGluIGluZGlyZWN0IGRlc2NyaXB0b3I6ICIKPiA+ID4gPiArCQkgICAg
ICAgImxlbiAweCVsbHggbm90IG11bHRpcGxlIG9mIDB4JXp4XG4iLAo+ID4gPiA+ICsJCSAgICAg
ICAodW5zaWduZWQgbG9uZyBsb25nKWxlbiwKPiA+ID4gPiArCQkgICAgICAgc2l6ZW9mIGRlc2Mp
Owo+ID4gPiA+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4gPiA+ICsJfQo+ID4gPiA+ICsKPiA+ID4g
PiArCXJldCA9IHRyYW5zbGF0ZV9kZXNjKHZxLCBpbmRpcmVjdC0+YWRkciwgbGVuLCB2cS0+aW5k
aXJlY3QsCj4gPiA+ID4gKwkJCSAgICAgVUlPX01BWElPViwgVkhPU1RfQUNDRVNTX1JPKTsKPiA+
ID4gPiArCWlmICh1bmxpa2VseShyZXQgPCAwKSkgewo+ID4gPiA+ICsJCWlmIChyZXQgIT0gLUVB
R0FJTikKPiA+ID4gPiArCQkJdnFfZXJyKHZxLCAiVHJhbnNsYXRpb24gZmFpbHVyZSAlZCBpbiBp
bmRpcmVjdC5cbiIsIHJldCk7Cj4gPiA+ID4gKwkJcmV0dXJuIHJldDsKPiA+ID4gPiArCX0KPiA+
ID4gPiArCWlvdl9pdGVyX2luaXQoJmZyb20sIFJFQUQsIHZxLT5pbmRpcmVjdCwgcmV0LCBsZW4p
Owo+ID4gPiA+ICsKPiA+ID4gPiArCS8qIFdlIHdpbGwgdXNlIHRoZSByZXN1bHQgYXMgYW4gYWRk
cmVzcyB0byByZWFkIGZyb20sIHNvIG1vc3QKPiA+ID4gPiArCSAqIGFyY2hpdGVjdHVyZXMgb25s
eSBuZWVkIGEgY29tcGlsZXIgYmFycmllciBoZXJlLiAqLwo+ID4gPiA+ICsJcmVhZF9iYXJyaWVy
X2RlcGVuZHMoKTsKPiA+ID4gPiArCj4gPiA+ID4gKwljb3VudCA9IGxlbiAvIHNpemVvZiBkZXNj
Owo+ID4gPiA+ICsJLyogQnVmZmVycyBhcmUgY2hhaW5lZCB2aWEgYSAxNiBiaXQgbmV4dCBmaWVs
ZCwgc28KPiA+ID4gPiArCSAqIHdlIGNhbiBoYXZlIGF0IG1vc3QgMl4xNiBvZiB0aGVzZS4gKi8K
PiA+ID4gPiArCWlmICh1bmxpa2VseShjb3VudCA+IFVTSFJUX01BWCArIDEpKSB7Cj4gPiA+ID4g
KwkJdnFfZXJyKHZxLCAiSW5kaXJlY3QgYnVmZmVyIGxlbmd0aCB0b28gYmlnOiAlZFxuIiwKPiA+
ID4gPiArCQkgICAgICAgaW5kaXJlY3QtPmxlbik7Cj4gPiA+ID4gKwkJcmV0dXJuIC1FMkJJRzsK
PiA+ID4gPiArCX0KPiA+ID4gPiArCWlmICh1bmxpa2VseSh2cS0+bmRlc2NzICsgY291bnQgPiB2
cS0+bWF4X2Rlc2NzKSkgewo+ID4gPiA+ICsJCXZxX2Vycih2cSwgIlRvbyBtYW55IGluZGlyZWN0
ICsgZGlyZWN0IGRlc2NzOiAlZCArICVkXG4iLAo+ID4gPiA+ICsJCSAgICAgICB2cS0+bmRlc2Nz
LCBpbmRpcmVjdC0+bGVuKTsKPiA+ID4gPiArCQlyZXR1cm4gLUUyQklHOwo+ID4gPiA+ICsJfQo+
ID4gPiA+ICsKPiA+ID4gPiArCWRvIHsKPiA+ID4gPiArCQlpZiAodW5saWtlbHkoKytmb3VuZCA+
IGNvdW50KSkgewo+ID4gPiA+ICsJCQl2cV9lcnIodnEsICJMb29wIGRldGVjdGVkOiBsYXN0IG9u
ZSBhdCAldSAiCj4gPiA+ID4gKwkJCSAgICAgICAiaW5kaXJlY3Qgc2l6ZSAldVxuIiwKPiA+ID4g
PiArCQkJICAgICAgIGksIGNvdW50KTsKPiA+ID4gPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gPiA+
ID4gKwkJfQo+ID4gPiA+ICsJCWlmICh1bmxpa2VseSghY29weV9mcm9tX2l0ZXJfZnVsbCgmZGVz
Yywgc2l6ZW9mKGRlc2MpLCAmZnJvbSkpKSB7Cj4gPiA+ID4gKwkJCXZxX2Vycih2cSwgIkZhaWxl
ZCBpbmRpcmVjdCBkZXNjcmlwdG9yOiBpZHggJWQsICV6eFxuIiwKPiA+ID4gPiArCQkJICAgICAg
IGksIChzaXplX3QpaW5kaXJlY3QtPmFkZHIgKyBpICogc2l6ZW9mIGRlc2MpOwo+ID4gPiA+ICsJ
CQlyZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiArCQl9Cj4gPiA+ID4gKwkJaWYgKHVubGlrZWx5KGRl
c2MuZmxhZ3MgJiBjcHVfdG9fdmhvc3QxNih2cSwgVlJJTkdfREVTQ19GX0lORElSRUNUKSkpIHsK
PiA+ID4gPiArCQkJdnFfZXJyKHZxLCAiTmVzdGVkIGluZGlyZWN0IGRlc2NyaXB0b3I6IGlkeCAl
ZCwgJXp4XG4iLAo+ID4gPiA+ICsJCQkgICAgICAgaSwgKHNpemVfdClpbmRpcmVjdC0+YWRkciAr
IGkgKiBzaXplb2YgZGVzYyk7Cj4gPiA+ID4gKwkJCXJldHVybiAtRUlOVkFMOwo+ID4gPiA+ICsJ
CX0KPiA+ID4gPiArCj4gPiA+ID4gKwkJcHVzaF9zcGxpdF9kZXNjKHZxLCAmZGVzYywgaGVhZCk7
Cj4gPiA+IAo+ID4gPiBUaGUgZXJyb3IgaXMgaWdub3JlZC4KPiA+IFNlZSBhYm92ZToKPiA+IAo+
ID4gICAgICAgCWlmICh1bmxpa2VseSh2cS0+bmRlc2NzICsgY291bnQgPiB2cS0+bWF4X2Rlc2Nz
KSkKPiA+IAo+ID4gU28gaXQgY2FuJ3QgZmFpbCBoZXJlLCB3ZSBuZXZlciBmZXRjaCB1bmxlc3Mg
dGhlcmUncyBzcGFjZS4KPiA+IAo+ID4gSSBndWVzcyB3ZSBjYW4gYWRkIGEgV0FSTl9PTiBoZXJl
Lgo+IAo+IAo+IFllcy4KPiAKPiAKPiA+IAo+ID4gPiA+ICsJfSB3aGlsZSAoKGkgPSBuZXh0X2Rl
c2ModnEsICZkZXNjKSkgIT0gLTEpOwo+ID4gPiA+ICsJcmV0dXJuIDA7Cj4gPiA+ID4gK30KPiA+
ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBpbnQgZmV0Y2hfZGVzY3Moc3RydWN0IHZob3N0X3ZpcnRx
dWV1ZSAqdnEpCj4gPiA+ID4gK3sKPiA+ID4gPiArCXVuc2lnbmVkIGludCBpLCBoZWFkLCBmb3Vu
ZCA9IDA7Cj4gPiA+ID4gKwlzdHJ1Y3Qgdmhvc3RfZGVzYyAqbGFzdDsKPiA+ID4gPiArCXN0cnVj
dCB2cmluZ19kZXNjIGRlc2M7Cj4gPiA+ID4gKwlfX3ZpcnRpbzE2IGF2YWlsX2lkeDsKPiA+ID4g
PiArCV9fdmlydGlvMTYgcmluZ19oZWFkOwo+ID4gPiA+ICsJdTE2IGxhc3RfYXZhaWxfaWR4Owo+
ID4gPiA+ICsJaW50IHJldDsKPiA+ID4gPiArCj4gPiA+ID4gKwkvKiBDaGVjayBpdCBpc24ndCBk
b2luZyB2ZXJ5IHN0cmFuZ2UgdGhpbmdzIHdpdGggZGVzY3JpcHRvciBudW1iZXJzLiAqLwo+ID4g
PiA+ICsJbGFzdF9hdmFpbF9pZHggPSB2cS0+bGFzdF9hdmFpbF9pZHg7Cj4gPiA+ID4gKwo+ID4g
PiA+ICsJaWYgKHZxLT5hdmFpbF9pZHggPT0gdnEtPmxhc3RfYXZhaWxfaWR4KSB7Cj4gPiA+ID4g
KwkJaWYgKHVubGlrZWx5KHZob3N0X2dldF9hdmFpbF9pZHgodnEsICZhdmFpbF9pZHgpKSkgewo+
ID4gPiA+ICsJCQl2cV9lcnIodnEsICJGYWlsZWQgdG8gYWNjZXNzIGF2YWlsIGlkeCBhdCAlcFxu
IiwKPiA+ID4gPiArCQkJCSZ2cS0+YXZhaWwtPmlkeCk7Cj4gPiA+ID4gKwkJCXJldHVybiAtRUZB
VUxUOwo+ID4gPiA+ICsJCX0KPiA+ID4gPiArCQl2cS0+YXZhaWxfaWR4ID0gdmhvc3QxNl90b19j
cHUodnEsIGF2YWlsX2lkeCk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJCWlmICh1bmxpa2VseSgodTE2
KSh2cS0+YXZhaWxfaWR4IC0gbGFzdF9hdmFpbF9pZHgpID4gdnEtPm51bSkpIHsKPiA+ID4gPiAr
CQkJdnFfZXJyKHZxLCAiR3Vlc3QgbW92ZWQgdXNlZCBpbmRleCBmcm9tICV1IHRvICV1IiwKPiA+
ID4gPiArCQkJCWxhc3RfYXZhaWxfaWR4LCB2cS0+YXZhaWxfaWR4KTsKPiA+ID4gPiArCQkJcmV0
dXJuIC1FRkFVTFQ7Cj4gPiA+ID4gKwkJfQo+ID4gPiA+ICsKPiA+ID4gPiArCQkvKiBJZiB0aGVy
ZSdzIG5vdGhpbmcgbmV3IHNpbmNlIGxhc3Qgd2UgbG9va2VkLCByZXR1cm4KPiA+ID4gPiArCQkg
KiBpbnZhbGlkLgo+ID4gPiA+ICsJCSAqLwo+ID4gPiA+ICsJCWlmICh2cS0+YXZhaWxfaWR4ID09
IGxhc3RfYXZhaWxfaWR4KQo+ID4gPiA+ICsJCQlyZXR1cm4gdnEtPm51bTsKPiA+ID4gPiArCj4g
PiA+ID4gKwkJLyogT25seSBnZXQgYXZhaWwgcmluZyBlbnRyaWVzIGFmdGVyIHRoZXkgaGF2ZSBi
ZWVuCj4gPiA+ID4gKwkJICogZXhwb3NlZCBieSBndWVzdC4KPiA+ID4gPiArCQkgKi8KPiA+ID4g
PiArCQlzbXBfcm1iKCk7Cj4gPiA+ID4gKwl9Cj4gPiA+ID4gKwo+ID4gPiA+ICsJLyogR3JhYiB0
aGUgbmV4dCBkZXNjcmlwdG9yIG51bWJlciB0aGV5J3JlIGFkdmVydGlzaW5nICovCj4gPiA+ID4g
KwlpZiAodW5saWtlbHkodmhvc3RfZ2V0X2F2YWlsX2hlYWQodnEsICZyaW5nX2hlYWQsIGxhc3Rf
YXZhaWxfaWR4KSkpIHsKPiA+ID4gPiArCQl2cV9lcnIodnEsICJGYWlsZWQgdG8gcmVhZCBoZWFk
OiBpZHggJWQgYWRkcmVzcyAlcFxuIiwKPiA+ID4gPiArCQkgICAgICAgbGFzdF9hdmFpbF9pZHgs
Cj4gPiA+ID4gKwkJICAgICAgICZ2cS0+YXZhaWwtPnJpbmdbbGFzdF9hdmFpbF9pZHggJSB2cS0+
bnVtXSk7Cj4gPiA+ID4gKwkJcmV0dXJuIC1FRkFVTFQ7Cj4gPiA+ID4gKwl9Cj4gPiA+ID4gKwo+
ID4gPiA+ICsJaGVhZCA9IHZob3N0MTZfdG9fY3B1KHZxLCByaW5nX2hlYWQpOwo+ID4gPiA+ICsK
PiA+ID4gPiArCS8qIElmIHRoZWlyIG51bWJlciBpcyBzaWxseSwgdGhhdCdzIGFuIGVycm9yLiAq
Lwo+ID4gPiA+ICsJaWYgKHVubGlrZWx5KGhlYWQgPj0gdnEtPm51bSkpIHsKPiA+ID4gPiArCQl2
cV9lcnIodnEsICJHdWVzdCBzYXlzIGluZGV4ICV1ID4gJXUgaXMgYXZhaWxhYmxlIiwKPiA+ID4g
PiArCQkgICAgICAgaGVhZCwgdnEtPm51bSk7Cj4gPiA+ID4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4g
PiA+ID4gKwl9Cj4gPiA+ID4gKwo+ID4gPiA+ICsJaSA9IGhlYWQ7Cj4gPiA+ID4gKwlkbyB7Cj4g
PiA+ID4gKwkJaWYgKHVubGlrZWx5KGkgPj0gdnEtPm51bSkpIHsKPiA+ID4gPiArCQkJdnFfZXJy
KHZxLCAiRGVzYyBpbmRleCBpcyAldSA+ICV1LCBoZWFkID0gJXUiLAo+ID4gPiA+ICsJCQkgICAg
ICAgaSwgdnEtPm51bSwgaGVhZCk7Cj4gPiA+ID4gKwkJCXJldHVybiAtRUlOVkFMOwo+ID4gPiA+
ICsJCX0KPiA+ID4gPiArCQlpZiAodW5saWtlbHkoKytmb3VuZCA+IHZxLT5udW0pKSB7Cj4gPiA+
ID4gKwkJCXZxX2Vycih2cSwgIkxvb3AgZGV0ZWN0ZWQ6IGxhc3Qgb25lIGF0ICV1ICIKPiA+ID4g
PiArCQkJICAgICAgICJ2cSBzaXplICV1IGhlYWQgJXVcbiIsCj4gPiA+ID4gKwkJCSAgICAgICBp
LCB2cS0+bnVtLCBoZWFkKTsKPiA+ID4gPiArCQkJcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gKwkJ
fQo+ID4gPiA+ICsJCXJldCA9IHZob3N0X2dldF9kZXNjKHZxLCAmZGVzYywgaSk7Cj4gPiA+ID4g
KwkJaWYgKHVubGlrZWx5KHJldCkpIHsKPiA+ID4gPiArCQkJdnFfZXJyKHZxLCAiRmFpbGVkIHRv
IGdldCBkZXNjcmlwdG9yOiBpZHggJWQgYWRkciAlcFxuIiwKPiA+ID4gPiArCQkJICAgICAgIGks
IHZxLT5kZXNjICsgaSk7Cj4gPiA+ID4gKwkJCXJldHVybiAtRUZBVUxUOwo+ID4gPiA+ICsJCX0K
PiA+ID4gPiArCQlyZXQgPSBwdXNoX3NwbGl0X2Rlc2ModnEsICZkZXNjLCBoZWFkKTsKPiA+ID4g
PiArCQlpZiAodW5saWtlbHkocmV0KSkgewo+ID4gPiA+ICsJCQl2cV9lcnIodnEsICJGYWlsZWQg
dG8gc2F2ZSBkZXNjcmlwdG9yOiBpZHggJWRcbiIsIGkpOwo+ID4gPiA+ICsJCQlyZXR1cm4gLUVJ
TlZBTDsKPiA+ID4gPiArCQl9Cj4gPiA+ID4gKwl9IHdoaWxlICgoaSA9IG5leHRfZGVzYyh2cSwg
JmRlc2MpKSAhPSAtMSk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsJbGFzdCA9IHBlZWtfc3BsaXRfZGVz
Yyh2cSk7Cj4gPiA+ID4gKwlpZiAodW5saWtlbHkobGFzdC0+ZmxhZ3MgJiBWUklOR19ERVNDX0Zf
SU5ESVJFQ1QpKSB7Cj4gPiA+ID4gKwkJcG9wX3NwbGl0X2Rlc2ModnEpOwo+ID4gPiA+ICsJCXJl
dCA9IGZldGNoX2luZGlyZWN0X2Rlc2NzKHZxLCBsYXN0LCBoZWFkKTsKPiA+ID4gCj4gPiA+IE5v
dGUgdGhhdCB0aGlzIG1lYW5zIHdlIGRvbid0IHN1cHBvcnRlZCBjaGFpbmVkIGluZGlyZWN0IGRl
c2NyaXB0b3JzIHdoaWNoCj4gPiA+IGNvbXBsaWVzIHRoZSBzcGVjIGJ1dCB3ZSBzdXBwb3J0IHRo
aXMgaW4gdmhvc3RfZ2V0X3ZxX2Rlc2MoKS4KPiA+IFdlbGwgdGhlIHNwZWMgc2F5czoKPiA+IAlB
IGRyaXZlciBNVVNUIE5PVCBzZXQgYm90aCBWSVJUUV9ERVNDX0ZfSU5ESVJFQ1QgYW5kIFZJUlRR
X0RFU0NfRl9ORVhUIGluIGZsYWdzLgo+ID4gCj4gPiBEaWQgSSBtaXNzIGFueXRoaW5nPwo+ID4g
Cj4gCj4gTm8sIGJ1dCBJIG1lYW50IGN1cnJlbnQgdmhvc3RfZ2V0X3ZxX2Rlc2MoKSBzdXBwb3J0
cyBjaGFpbmVkIGluZGlyZWN0Cj4gZGVzY3JpcHRvci4gTm90IHN1cmUgaWYgdGhlcmUncyBhbiBh
cHBsaWNhdGlvbiB0aGF0IGRlcGVuZHMgb24gdGhpcwo+IHNpbGVudGx5Lgo+IAo+IFRoYW5rcwo+
IAoKSSBkb24ndCB0aGluayB3ZSBuZWVkIHRvIHdvcnJ5IGFib3V0IHRoYXQgdW5sZXNzIHRoaXMg
YWN0dWFsbHkKc3VyZmFjZXMuCgotLSAKTVNUCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
