Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC0CCB028
	for <lists.virtualization@lfdr.de>; Thu,  3 Oct 2019 22:29:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EC7121578;
	Thu,  3 Oct 2019 20:29:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EE85B1574
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 20:29:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 43D5E189
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 20:29:28 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id l21so3840324edr.5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 03 Oct 2019 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:user-agent; bh=u7ZYonuNP9SAqKQUA4lb0Fri1p8aW+ORUTZ38/PqnQA=;
	b=He4q4BaVzz3ysrDjqZmQhSBfWZlpceOetRwr/NpYef80KX0Qruy9e8fdi4wXzf2kDX
	R3WhG4toYhzzvFCma3V937xC5vMzpVdN/q9rWM5LSF8OUwWWGdtvd/lEOpxqdpG+TEFg
	PbXOUYo6dA4m1VKnSNbnu/2uWRffLzPSn3PN8qbyybBiGga65wjPuIYtf/oj2a5z1+MV
	8E7k8owGm3tUFkiqTrKkwNolcmIgl5RT951yANA7krwczT45eYgfDr3TtXvApssqvKME
	uRN+KgaPIcGdw0qyCqjRAMUUSpCmZ80s2r3VewekJS8DkLNSR6/LpiJ5DKUiunF4lcCW
	jl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=u7ZYonuNP9SAqKQUA4lb0Fri1p8aW+ORUTZ38/PqnQA=;
	b=U3Ok2f6F5zVQ3DqnukOY0nnQTGmyWsifGfUV/rD8SljLX8eGnXR2N34npJmlCrqtnj
	v+kszjxkZxiBwfH53Vz+4aXNgV/Ct+a06px2x0QFAigWZP/yQk8VnUtTWDomncfIXZM1
	UH3rMgsGBbqz9xfSYkXqXW3hWEJafd4o2MstKASZRflAAVmxNSZW46eNjoaaIXy2o13H
	xD6+aEphfYhJy8oNwVOn8H+zMYRudk+QjiXRE1DhIlLz7qwP2djz6WCfbwgKibN3jlmN
	xjdK4L+kaehoH0cSMo2dd4lQxmqEMT+v12D6MzoRAe6mXuONlzZcJO36/k+PVOxMeo5z
	ruLA==
X-Gm-Message-State: APjAAAUuzOgIgUFk6+J6cfzcpXyEbANBdLQizpqNuxd2KbPGF42p1Uwo
	UNTOEpPri9H3HbshAfBYdQ==
X-Google-Smtp-Source: APXvYqxm4qn6mXmhwnprpw33vR7yG2Zefk8mywl9KAbSBAJFJ6LB7yDYFggcdc6aA1kL894UxSoqRA==
X-Received: by 2002:a17:907:20a2:: with SMTP id
	pw2mr9203607ejb.163.1570134566810; 
	Thu, 03 Oct 2019 13:29:26 -0700 (PDT)
Received: from avx2 ([46.53.250.203])
	by smtp.gmail.com with ESMTPSA id c26sm664660edb.2.2019.10.03.13.29.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Oct 2019 13:29:26 -0700 (PDT)
Date: Thu, 3 Oct 2019 23:29:24 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: davem@davemloft.net
Subject: [PATCH net-next] net, uapi: fix -Wpointer-arith warnings
Message-ID: <20191003202924.GA21016@avx2>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jon.maloy@ericsson.com, mst@redhat.com, netdev@vger.kernel.org,
	fw@strlen.de, kadlec@netfilter.org,
	netfilter-devel@vger.kernel.org, ying.xue@windriver.com,
	virtualization@lists.linux-foundation.org, pablo@netfilter.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Add casts to fix these warnings:

./usr/include/linux/netfilter_arp/arp_tables.h:200:19: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
./usr/include/linux/netfilter_bridge/ebtables.h:197:19: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
./usr/include/linux/netfilter_ipv4/ip_tables.h:223:19: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
./usr/include/linux/netfilter_ipv6/ip6_tables.h:263:19: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
./usr/include/linux/tipc_config.h:310:28: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
./usr/include/linux/tipc_config.h:410:24: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]
./usr/include/linux/virtio_ring.h:170:16: error: pointer of type 'void *' used in arithmetic [-Werror=pointer-arith]

Those are theoretical probably but kernel doesn't control compiler flags
in userspace.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 include/uapi/linux/netfilter_arp/arp_tables.h  |    2 +-
 include/uapi/linux/netfilter_bridge/ebtables.h |    2 +-
 include/uapi/linux/netfilter_ipv4/ip_tables.h  |    2 +-
 include/uapi/linux/netfilter_ipv6/ip6_tables.h |    2 +-
 include/uapi/linux/tipc_config.h               |    4 ++--
 include/uapi/linux/virtio_ring.h               |    2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

--- a/include/uapi/linux/netfilter_arp/arp_tables.h
+++ b/include/uapi/linux/netfilter_arp/arp_tables.h
@@ -199,7 +199,7 @@ struct arpt_get_entries {
 /* Helper functions */
 static __inline__ struct xt_entry_target *arpt_get_target(struct arpt_entry *e)
 {
-	return (void *)e + e->target_offset;
+	return (struct xt_entry_target *)((char *)e + e->target_offset);
 }
 
 /*
--- a/include/uapi/linux/netfilter_bridge/ebtables.h
+++ b/include/uapi/linux/netfilter_bridge/ebtables.h
@@ -194,7 +194,7 @@ struct ebt_entry {
 static __inline__ struct ebt_entry_target *
 ebt_get_target(struct ebt_entry *e)
 {
-	return (void *)e + e->target_offset;
+	return (struct ebt_entry_target *)((char *)e + e->target_offset);
 }
 
 /* {g,s}etsockopt numbers */
--- a/include/uapi/linux/netfilter_ipv4/ip_tables.h
+++ b/include/uapi/linux/netfilter_ipv4/ip_tables.h
@@ -222,7 +222,7 @@ struct ipt_get_entries {
 static __inline__ struct xt_entry_target *
 ipt_get_target(struct ipt_entry *e)
 {
-	return (void *)e + e->target_offset;
+	return (struct xt_entry_target *)((char *)e + e->target_offset);
 }
 
 /*
--- a/include/uapi/linux/netfilter_ipv6/ip6_tables.h
+++ b/include/uapi/linux/netfilter_ipv6/ip6_tables.h
@@ -262,7 +262,7 @@ struct ip6t_get_entries {
 static __inline__ struct xt_entry_target *
 ip6t_get_target(struct ip6t_entry *e)
 {
-	return (void *)e + e->target_offset;
+	return (struct xt_entry_target *)((char *)e + e->target_offset);
 }
 
 /*
--- a/include/uapi/linux/tipc_config.h
+++ b/include/uapi/linux/tipc_config.h
@@ -309,7 +309,7 @@ static inline int TLV_SET(void *tlv, __u16 type, void *data, __u16 len)
 	tlv_ptr->tlv_len  = htons(tlv_len);
 	if (len && data) {
 		memcpy(TLV_DATA(tlv_ptr), data, len);
-		memset(TLV_DATA(tlv_ptr) + len, 0, TLV_SPACE(len) - tlv_len);
+		memset((char *)TLV_DATA(tlv_ptr) + len, 0, TLV_SPACE(len) - tlv_len);
 	}
 	return TLV_SPACE(len);
 }
@@ -409,7 +409,7 @@ static inline int TCM_SET(void *msg, __u16 cmd, __u16 flags,
 	tcm_hdr->tcm_flags = htons(flags);
 	if (data_len && data) {
 		memcpy(TCM_DATA(msg), data, data_len);
-		memset(TCM_DATA(msg) + data_len, 0, TCM_SPACE(data_len) - msg_len);
+		memset((char *)TCM_DATA(msg) + data_len, 0, TCM_SPACE(data_len) - msg_len);
 	}
 	return TCM_SPACE(data_len);
 }
--- a/include/uapi/linux/virtio_ring.h
+++ b/include/uapi/linux/virtio_ring.h
@@ -169,7 +169,7 @@ static inline void vring_init(struct vring *vr, unsigned int num, void *p,
 {
 	vr->num = num;
 	vr->desc = p;
-	vr->avail = p + num*sizeof(struct vring_desc);
+	vr->avail = (struct vring_avail *)((char *)p + num * sizeof(struct vring_desc));
 	vr->used = (void *)(((uintptr_t)&vr->avail->ring[num] + sizeof(__virtio16)
 		+ align-1) & ~(align - 1));
 }
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
