Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1A1A0410
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:08:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1B95886E1F;
	Tue,  7 Apr 2020 01:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VIvIXIHNlOKG; Tue,  7 Apr 2020 01:08:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9028F87765;
	Tue,  7 Apr 2020 01:08:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F0B1C0177;
	Tue,  7 Apr 2020 01:08:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02436C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AFC7C88618
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:08:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLeRbsb+frgB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:08:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 94DE488601
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4yUJTneo14gmnV6yvCsrtosUccNNJJsj0HwyG8nxy8=;
 b=T6oXOIBo7XvYJa/9UWCfTjIKd9QoVDCQZmzyE49SelC5SrQC0/5Ew6O75JvYRe+ZDxbFCD
 z3URrq6hrJkkR1EDDDsGLjG4SZ876+q6ldX68gdGiVi2Ct9Fn3RmpTIOBaJEQgTyDhZJvr
 ESrhtlVmuaBB7khZoWy/5C8HkM5hur4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-HFiooImPPwidqrIDeve-fg-1; Mon, 06 Apr 2020 21:08:14 -0400
X-MC-Unique: HFiooImPPwidqrIDeve-fg-1
Received: by mail-wr1-f69.google.com with SMTP id i18so840240wrx.17
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:08:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=L4yUJTneo14gmnV6yvCsrtosUccNNJJsj0HwyG8nxy8=;
 b=Dn4Jg/ZCzaQFUOgCrzHohGp9i3OMAa7E7wptOYwEnDKHLyAI9LpV6mXTbKBYhRL2EV
 Njn6ELrMwlrg5V4pBVJTDnK8IlSu9uLVU3uBhYLmBGMCIxzJYryzzMtv1wAjnNR3HV3Z
 RjuehOCyOBQRY85RwSf1Rt/Ezcw+7qONb5je6jYJXYLteMQQmJWFG+IyZLbrn9S7elBi
 8gVk3OhHWlfPHSdSu73BhuOGL44i4Il6VO3Nwc/OLlD+Z6GmlxnB1FZkjUmqZCfspNdj
 wpx3JNPHhAZh5YUG83Y6cxdw7lGKA2pqZ902/6VlSv3uF1tq5th61PpoRoPxzdrroA8U
 Bj3Q==
X-Gm-Message-State: AGi0Pubgdksx3A7kG1oaG2wO7SrJAZAJDiXuB22LFQml2wMmv+QqHLRq
 COVLzRjo/2dFkeVyapaj7e3+1lvri4OJPvvzzKTr8bcRnD5oR2UYO2jXGJybudkJTdmFAEno/Mm
 6FQYA+NA/5695bB8W/u6YNJuC4ff/KK+gIVb1xbo73w==
X-Received: by 2002:a5d:4ac2:: with SMTP id y2mr2231407wrs.340.1586221692864; 
 Mon, 06 Apr 2020 18:08:12 -0700 (PDT)
X-Google-Smtp-Source: APiQypJRyp/ZpJacQiZ3k9H+aTIpbKPM4w8UFFPSIqcFT0rwHZZkPHnvafzAm6P2M2/gPs/IswWSoA==
X-Received: by 2002:a5d:4ac2:: with SMTP id y2mr2231387wrs.340.1586221692600; 
 Mon, 06 Apr 2020 18:08:12 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id c17sm23267693wrp.28.2020.04.06.18.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:08:12 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:08:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 19/19] vhost: batching fetches
Message-ID: <20200407010700.446571-20-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

V2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQsIG5ldyBhbmQgb2xkIGNvZGUgcGVyZm9ybSBpZGVudGlj
YWxseS4KCkxvdHMgb2YgZXh0cmEgb3B0aW1pemF0aW9ucyBhcmUgbm93IHBvc3NpYmxlLCBlLmcu
CndlIGNhbiBmZXRjaCBtdWx0aXBsZSBoZWFkcyB3aXRoIGNvcHlfZnJvbS90b191c2VyIG5vdy4K
V2UgY2FuIGdldCByaWQgb2YgbWFpbnRhaW5pbmcgdGhlIGxvZyBhcnJheS4gIEV0YyBldGMuCgpT
aWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpTaWduZWQt
b2ZmLWJ5OiBFdWdlbmlvIFDDqXJleiA8ZXBlcmV6bWFAcmVkaGF0LmNvbT4KTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIwMDQwMTE4MzExOC44MzM0LTQtZXBlcmV6bWFAcmVkaGF0
LmNvbQpTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgot
LS0KIGRyaXZlcnMvdmhvc3QvdGVzdC5jICB8ICAyICstCiBkcml2ZXJzL3Zob3N0L3Zob3N0LmMg
fCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJz
L3Zob3N0L3Zob3N0LmggfCAgNSArKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdGVzdC5jIGIv
ZHJpdmVycy92aG9zdC90ZXN0LmMKaW5kZXggYjA2NjgwODMzZjAzLi4yNTFjYTcyM2FjM2YgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmhvc3QvdGVzdC5jCisrKyBiL2RyaXZlcnMvdmhvc3QvdGVzdC5j
CkBAIC0xMTksNyArMTE5LDcgQEAgc3RhdGljIGludCB2aG9zdF90ZXN0X29wZW4oc3RydWN0IGlu
b2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmYpCiAJZGV2ID0gJm4tPmRldjsKIAl2cXNbVkhPU1Rf
VEVTVF9WUV0gPSAmbi0+dnFzW1ZIT1NUX1RFU1RfVlFdOwogCW4tPnZxc1tWSE9TVF9URVNUX1ZR
XS5oYW5kbGVfa2ljayA9IGhhbmRsZV92cV9raWNrOwotCXZob3N0X2Rldl9pbml0KGRldiwgdnFz
LCBWSE9TVF9URVNUX1ZRX01BWCwgVUlPX01BWElPViwKKwl2aG9zdF9kZXZfaW5pdChkZXYsIHZx
cywgVkhPU1RfVEVTVF9WUV9NQVgsIFVJT19NQVhJT1YgKyA2NCwKIAkJICAgICAgIFZIT1NUX1RF
U1RfUEtUX1dFSUdIVCwgVkhPU1RfVEVTVF9XRUlHSFQsIE5VTEwpOwogCiAJZi0+cHJpdmF0ZV9k
YXRhID0gbjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhv
c3Qvdmhvc3QuYwppbmRleCA2Y2E2NThjMjFlMTUuLjAzOTUyMjk0ODZhOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy92aG9zdC92aG9zdC5jCisrKyBiL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYwpAQCAtMjk5
LDYgKzI5OSw3IEBAIHN0YXRpYyB2b2lkIHZob3N0X3ZxX3Jlc2V0KHN0cnVjdCB2aG9zdF9kZXYg
KmRldiwKIHsKIAl2cS0+bnVtID0gMTsKIAl2cS0+bmRlc2NzID0gMDsKKwl2cS0+Zmlyc3RfZGVz
YyA9IDA7CiAJdnEtPmRlc2MgPSBOVUxMOwogCXZxLT5hdmFpbCA9IE5VTEw7CiAJdnEtPnVzZWQg
PSBOVUxMOwpAQCAtMzY3LDYgKzM2OCwxMSBAQCBzdGF0aWMgaW50IHZob3N0X3dvcmtlcih2b2lk
ICpkYXRhKQogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IHZob3N0X3ZxX251bV9iYXRjaF9k
ZXNjcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKK3sKKwlyZXR1cm4gdnEtPm1heF9kZXNj
cyAtIFVJT19NQVhJT1Y7Cit9CisKIHN0YXRpYyB2b2lkIHZob3N0X3ZxX2ZyZWVfaW92ZWNzKHN0
cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQogewogCWtmcmVlKHZxLT5kZXNjcyk7CkBAIC0zODks
NiArMzk1LDkgQEAgc3RhdGljIGxvbmcgdmhvc3RfZGV2X2FsbG9jX2lvdmVjcyhzdHJ1Y3Qgdmhv
c3RfZGV2ICpkZXYpCiAJZm9yIChpID0gMDsgaSA8IGRldi0+bnZxczsgKytpKSB7CiAJCXZxID0g
ZGV2LT52cXNbaV07CiAJCXZxLT5tYXhfZGVzY3MgPSBkZXYtPmlvdl9saW1pdDsKKwkJaWYgKHZo
b3N0X3ZxX251bV9iYXRjaF9kZXNjcyh2cSkgPCAwKSB7CisJCQlyZXR1cm4gLUVJTlZBTDsKKwkJ
fQogCQl2cS0+ZGVzY3MgPSBrbWFsbG9jX2FycmF5KHZxLT5tYXhfZGVzY3MsCiAJCQkJCSAgc2l6
ZW9mKCp2cS0+ZGVzY3MpLAogCQkJCQkgIEdGUF9LRVJORUwpOwpAQCAtMTU3MCw2ICsxNTc5LDcg
QEAgbG9uZyB2aG9zdF92cmluZ19pb2N0bChzdHJ1Y3Qgdmhvc3RfZGV2ICpkLCB1bnNpZ25lZCBp
bnQgaW9jdGwsIHZvaWQgX191c2VyICphcmcKIAkJdnEtPmxhc3RfYXZhaWxfaWR4ID0gcy5udW07
CiAJCS8qIEZvcmdldCB0aGUgY2FjaGVkIGluZGV4IHZhbHVlLiAqLwogCQl2cS0+YXZhaWxfaWR4
ID0gdnEtPmxhc3RfYXZhaWxfaWR4OworCQl2cS0+bmRlc2NzID0gdnEtPmZpcnN0X2Rlc2MgPSAw
OwogCQlicmVhazsKIAljYXNlIFZIT1NUX0dFVF9WUklOR19CQVNFOgogCQlzLmluZGV4ID0gaWR4
OwpAQCAtMjEzNiw3ICsyMTQ2LDcgQEAgc3RhdGljIGludCBmZXRjaF9pbmRpcmVjdF9kZXNjcyhz
dHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBm
ZXRjaF9kZXNjcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkKK3N0YXRpYyBpbnQgZmV0Y2hf
YnVmKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQogewogCXVuc2lnbmVkIGludCBpLCBoZWFk
LCBmb3VuZCA9IDA7CiAJc3RydWN0IHZob3N0X2Rlc2MgKmxhc3Q7CkBAIC0yMTQ5LDcgKzIxNTks
MTEgQEAgc3RhdGljIGludCBmZXRjaF9kZXNjcyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSkK
IAkvKiBDaGVjayBpdCBpc24ndCBkb2luZyB2ZXJ5IHN0cmFuZ2UgdGhpbmdzIHdpdGggZGVzY3Jp
cHRvciBudW1iZXJzLiAqLwogCWxhc3RfYXZhaWxfaWR4ID0gdnEtPmxhc3RfYXZhaWxfaWR4Owog
Ci0JaWYgKHZxLT5hdmFpbF9pZHggPT0gdnEtPmxhc3RfYXZhaWxfaWR4KSB7CisJaWYgKHVubGlr
ZWx5KHZxLT5hdmFpbF9pZHggPT0gdnEtPmxhc3RfYXZhaWxfaWR4KSkgeworCQkvKiBJZiB3ZSBh
bHJlYWR5IGhhdmUgd29yayB0byBkbywgZG9uJ3QgYm90aGVyIHJlLWNoZWNraW5nLiAqLworCQlp
ZiAobGlrZWx5KHZxLT5uZGVzY3MpKQorCQkJcmV0dXJuIHZxLT5udW07CisKIAkJaWYgKHVubGlr
ZWx5KHZob3N0X2dldF9hdmFpbF9pZHgodnEsICZhdmFpbF9pZHgpKSkgewogCQkJdnFfZXJyKHZx
LCAiRmFpbGVkIHRvIGFjY2VzcyBhdmFpbCBpZHggYXQgJXBcbiIsCiAJCQkJJnZxLT5hdmFpbC0+
aWR4KTsKQEAgLTIyNDAsNiArMjI1NCwyNCBAQCBzdGF0aWMgaW50IGZldGNoX2Rlc2NzKHN0cnVj
dCB2aG9zdF92aXJ0cXVldWUgKnZxKQogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IGZldGNo
X2Rlc2NzKHN0cnVjdCB2aG9zdF92aXJ0cXVldWUgKnZxKQoreworCWludCByZXQgPSAwOworCisJ
aWYgKHVubGlrZWx5KHZxLT5maXJzdF9kZXNjID49IHZxLT5uZGVzY3MpKSB7CisJCXZxLT5maXJz
dF9kZXNjID0gMDsKKwkJdnEtPm5kZXNjcyA9IDA7CisJfQorCisJaWYgKHZxLT5uZGVzY3MpCisJ
CXJldHVybiAwOworCisJd2hpbGUgKCFyZXQgJiYgdnEtPm5kZXNjcyA8PSB2aG9zdF92cV9udW1f
YmF0Y2hfZGVzY3ModnEpKQorCQlyZXQgPSBmZXRjaF9idWYodnEpOworCisJcmV0dXJuIHZxLT5u
ZGVzY3MgPyAwIDogcmV0OworfQorCiAvKiBUaGlzIGxvb2tzIGluIHRoZSB2aXJ0cXVldWUgYW5k
IGZvciB0aGUgZmlyc3QgYXZhaWxhYmxlIGJ1ZmZlciwgYW5kIGNvbnZlcnRzCiAgKiBpdCB0byBh
biBpb3ZlYyBmb3IgY29udmVuaWVudCBhY2Nlc3MuICBTaW5jZSBkZXNjcmlwdG9ycyBjb25zaXN0
IG9mIHNvbWUKICAqIG51bWJlciBvZiBvdXRwdXQgdGhlbiBzb21lIG51bWJlciBvZiBpbnB1dCBk
ZXNjcmlwdG9ycywgaXQncyBhY3R1YWxseSB0d28KQEAgLTIyNjUsNyArMjI5Nyw3IEBAIGludCB2
aG9zdF9nZXRfdnFfZGVzYyhzdHJ1Y3Qgdmhvc3RfdmlydHF1ZXVlICp2cSwKIAlpZiAodW5saWtl
bHkobG9nKSkKIAkJKmxvZ19udW0gPSAwOwogCi0JZm9yIChpID0gMDsgaSA8IHZxLT5uZGVzY3M7
ICsraSkgeworCWZvciAoaSA9IHZxLT5maXJzdF9kZXNjOyBpIDwgdnEtPm5kZXNjczsgKytpKSB7
CiAJCXVuc2lnbmVkIGlvdl9jb3VudCA9ICppbl9udW0gKyAqb3V0X251bTsKIAkJc3RydWN0IHZo
b3N0X2Rlc2MgKmRlc2MgPSAmdnEtPmRlc2NzW2ldOwogCQlpbnQgYWNjZXNzOwpAQCAtMjMxMSwx
NCArMjM0MywxOSBAQCBpbnQgdmhvc3RfZ2V0X3ZxX2Rlc2Moc3RydWN0IHZob3N0X3ZpcnRxdWV1
ZSAqdnEsCiAJCX0KIAogCQlyZXQgPSBkZXNjLT5pZDsKKworCQlpZiAoIShkZXNjLT5mbGFncyAm
IFZSSU5HX0RFU0NfRl9ORVhUKSkKKwkJCWJyZWFrOwogCX0KIAotCXZxLT5uZGVzY3MgPSAwOwor
CXZxLT5maXJzdF9kZXNjID0gaSArIDE7CiAKIAlyZXR1cm4gcmV0OwogCiBlcnI6Ci0Jdmhvc3Rf
ZGlzY2FyZF92cV9kZXNjKHZxLCAxKTsKKwlmb3IgKGkgPSB2cS0+Zmlyc3RfZGVzYzsgaSA8IHZx
LT5uZGVzY3M7ICsraSkKKwkJaWYgKCEodnEtPmRlc2NzW2ldLmZsYWdzICYgVlJJTkdfREVTQ19G
X05FWFQpKQorCQkJdmhvc3RfZGlzY2FyZF92cV9kZXNjKHZxLCAxKTsKIAl2cS0+bmRlc2NzID0g
MDsKIAogCXJldHVybiByZXQ7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmggYi9k
cml2ZXJzL3Zob3N0L3Zob3N0LmgKaW5kZXggNzYzNTZlZGVlOGU1Li5hNjdiZGE5NzkyZWMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuaAorKysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0
LmgKQEAgLTgxLDYgKzgxLDcgQEAgc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSB7CiAKIAlzdHJ1Y3Qg
dmhvc3RfZGVzYyAqZGVzY3M7CiAJaW50IG5kZXNjczsKKwlpbnQgZmlyc3RfZGVzYzsKIAlpbnQg
bWF4X2Rlc2NzOwogCiAJc3RydWN0IGZpbGUgKmtpY2s7CkBAIC0yMjksNyArMjMwLDcgQEAgdm9p
ZCB2aG9zdF9pb3RsYl9tYXBfZnJlZShzdHJ1Y3Qgdmhvc3RfaW90bGIgKmlvdGxiLAogCQkJICBz
dHJ1Y3Qgdmhvc3RfaW90bGJfbWFwICptYXApOwogCiAjZGVmaW5lIHZxX2Vycih2cSwgZm10LCAu
Li4pIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCQlwcl9kZWJ1Zyhw
cl9mbXQoZm10KSwgIyNfX1ZBX0FSR1NfXyk7ICAgICAgIFwKKwkJcHJfZXJyKHByX2ZtdChmbXQp
LCAjI19fVkFfQVJHU19fKTsgICAgICAgXAogCQlpZiAoKHZxKS0+ZXJyb3JfY3R4KSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCiAJCQkJZXZlbnRmZF9zaWduYWwoKHZxKS0+ZXJyb3Jf
Y3R4LCAxKTtcCiAJfSB3aGlsZSAoMCkKQEAgLTI1NSw2ICsyNTYsOCBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgdmhvc3RfdnFfc2V0X2JhY2tlbmQoc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAqdnEsCiAJ
CQkJCXZvaWQgKnByaXZhdGVfZGF0YSkKIHsKIAl2cS0+cHJpdmF0ZV9kYXRhID0gcHJpdmF0ZV9k
YXRhOworCXZxLT5uZGVzY3MgPSAwOworCXZxLT5maXJzdF9kZXNjID0gMDsKIH0KIAogLyoqCi0t
IApNU1QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZp
cnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0
aW5mby92aXJ0dWFsaXphdGlvbg==
